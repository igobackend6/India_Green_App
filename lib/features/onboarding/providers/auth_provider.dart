import 'dart:async';
import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/storage/hive_service.dart';
import '../../../core/services/supabase_service.dart';
import '../domain/entities/user_profile.dart';
import '../data/repositories/auth_repository_impl.dart';

part 'auth_provider.g.dart';

/// Authentication state model.
class AuthState {
  final bool isAuthenticated;
  final bool isLoading;
  final String? error;
  final UserProfile? profile;
  
  // Temporary storage during onboarding flow
  final List<String> selectedRoles;
  final String selectedLanguage;

  const AuthState({
    this.isAuthenticated = false,
    this.isLoading = false,
    this.error,
    this.profile,
    this.selectedRoles = const [],
    this.selectedLanguage = 'English',
  });

  // Sentinel so copyWith can distinguish "clear error" (pass null) from
  // "leave error unchanged" (omit the parameter entirely).
  static const _keep = Object();

  AuthState copyWith({
    bool? isAuthenticated,
    bool? isLoading,
    Object? error = _keep,      // omit → keep existing; pass null → clear
    UserProfile? profile,
    List<String>? selectedRoles,
    String? selectedLanguage,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      error: identical(error, _keep) ? this.error : error as String?,
      profile: profile ?? this.profile,
      selectedRoles: selectedRoles ?? this.selectedRoles,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }

  AuthState clearError() {
    return AuthState(
      isAuthenticated: isAuthenticated,
      isLoading: isLoading,
      error: null,
      profile: profile,
      selectedRoles: selectedRoles,
      selectedLanguage: selectedLanguage,
    );
  }
}

/// Manages authentication lifecycle and user session persistence.
@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  late final HiveService _hive;

  @override
  AuthState build() {
    _hive = ref.read(hiveServiceProvider);
    
    // Check initial Hive state for onboarding preferences
    final initialState = AuthState(
      selectedRoles: _hive.roles,
      selectedLanguage: _hive.selectedLanguage ?? 'English',
    );

    // Setup listener for Supabase auth changes
    _setupAuthListener();

    return initialState;
  }

  void _setupAuthListener() {
    final client = ref.read(supabaseServiceProvider).client;
    
    client.auth.onAuthStateChange.listen((data) async {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;

      if (event == AuthChangeEvent.signedIn && session != null) {
        // Fetch profile
        await _fetchProfile(session.user.id);
      } else if (event == AuthChangeEvent.signedOut) {
        state = state.copyWith(isAuthenticated: false, profile: null);
      }
    });

    // Check initial session
    final session = client.auth.currentSession;
    if (session != null) {
      _fetchProfile(session.user.id);
    }
  }

  Future<void> _fetchProfile(String userId) async {
    final authRepo = ref.read(authRepositoryProvider);
    final result = await authRepo.getProfile(userId);
    
    result.when(
      success: (profile) {
        if (profile != null) {
          state = state.copyWith(
            isAuthenticated: true,
            profile: profile,
          );
        } else {
          state = state.copyWith(
            isAuthenticated: false,
            error: 'Profile not found. Please complete registration.',
          );
        }
      },
      failure: (failure) {
        state = state.copyWith(error: failure.message);
      },
    );
  }

  void setLanguage(String lang) {
    state = state.copyWith(selectedLanguage: lang);
  }

  void toggleRole(String role) {
    final roles = List<String>.from(state.selectedRoles);
    roles.contains(role) ? roles.remove(role) : roles.add(role);
    state = state.copyWith(selectedRoles: roles);
  }

  Future<void> sendOtp(String phone) async {
    state = state.copyWith(isLoading: true, error: null);
    
    final formattedPhone = phone.startsWith('+') ? phone : '+91$phone';
    
    final authRepo = ref.read(authRepositoryProvider);
    final result = await authRepo.sendOtp(formattedPhone);

    result.when(
      success: (_) {
        state = state.copyWith(isLoading: false);
      },
      failure: (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
      },
    );
  }

  Future<void> verifyOtp(String phone, String otp) async {
    state = state.copyWith(isLoading: true, error: null);
    
    final formattedPhone = phone.startsWith('+') ? phone : '+91$phone';
    
    final authRepo = ref.read(authRepositoryProvider);
    final result = await authRepo.verifyOtp(formattedPhone, otp);

    result.when(
      success: (_) {
        state = state.copyWith(isLoading: false);
      },
      failure: (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
      },
    );
  }

  Future<bool> completeLogin({
    required String name,
    required String phone,
    required String pincode,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    final client = ref.read(supabaseServiceProvider).client;
    final user = client.auth.currentUser;
    
    if (user == null) {
      state = state.copyWith(
        isLoading: false, 
        error: 'Authentication failed. Please verify OTP first.'
      );
      return false;
    }

    final authRepo = ref.read(authRepositoryProvider);
    final result = await authRepo.createProfile(
      id: user.id,
      name: name,
      phone: phone,
      pincode: pincode,
      roles: state.selectedRoles,
    );

    return result.when(
      success: (profile) {
        state = state.copyWith(
          isLoading: false,
          isAuthenticated: true,
          profile: profile,
        );
        _hive.saveSession(
          name: name,
          phone: phone,
          pincode: pincode,
          roles: state.selectedRoles,
        );
        return true;
      },
      failure: (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
        return false;
      },
    );
  }

  /// Upload a profile photo to Supabase Storage and persist the URL.
  /// Returns the public URL on success, or throws with an error message.
  Future<String> uploadAvatar(File imageFile) async {
    final client = ref.read(supabaseServiceProvider).client;
    final userId = client.auth.currentUser?.id;
    if (userId == null) throw Exception('Not authenticated — please log in again.');

    state = state.copyWith(isLoading: true, error: null);

    final authRepo = ref.read(authRepositoryProvider);
    final result = await authRepo.uploadAvatar(
      userId: userId,
      imageFile: imageFile,
    );

    return result.when(
      success: (url) {
        if (state.profile != null) {
          state = state.copyWith(
            isLoading: false,
            profile: state.profile!.copyWith(avatarUrl: url),
          );
        } else {
          state = state.copyWith(isLoading: false);
        }
        return url;
      },
      failure: (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
        throw Exception(failure.message);
      },
    );
  }

  /// Remove the profile photo from Supabase Storage and clear the URL.
  Future<void> removeAvatar() async {
    final client = ref.read(supabaseServiceProvider).client;
    final userId = client.auth.currentUser?.id;
    if (userId == null) return;

    state = state.copyWith(isLoading: true);

    final authRepo = ref.read(authRepositoryProvider);
    final result = await authRepo.removeAvatar(userId: userId);

    result.when(
      success: (_) {
        if (state.profile != null) {
          state = state.copyWith(
            isLoading: false,
            profile: state.profile!.copyWith(avatarUrl: null),
          );
        } else {
          state = state.copyWith(isLoading: false);
        }
      },
      failure: (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
      },
    );
  }

  Future<void> logout() async {
    final authRepo = ref.read(authRepositoryProvider);
    await authRepo.logout();
    await _hive.clearSession();
    state = const AuthState();
  }
}
