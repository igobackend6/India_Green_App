import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/services/supabase_service.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final SupabaseClient _client;

  AuthRepositoryImpl(this._client);

  @override
  Future<Result<void>> sendOtp(String phone) async {
    try {
      final cleanPhone = phone.replaceAll(' ', '');
      await _client.auth.signInWithOtp(phone: cleanPhone);
      return const Success(null);
    } on AuthException catch (e) {
      return Error(AuthFailure(e.message));
    } catch (e) {
      return Error(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> verifyOtp(String phone, String otp) async {
    try {
      final cleanPhone = phone.replaceAll(' ', '');
      await _client.auth.verifyOTP(
        type: OtpType.sms,
        token: otp,
        phone: cleanPhone,
      );
      return const Success(null);
    } on AuthException catch (e) {
      return Error(AuthFailure(e.message));
    } catch (e) {
      return Error(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<UserProfile?>> getProfile(String userId) async {
    try {
      final data = await _client
          .from('profiles')
          .select()
          .eq('id', userId)
          .maybeSingle();

      if (data == null) {
        return const Success(null);
      }

      return Success(UserProfile.fromJson(data));
    } on PostgrestException catch (e) {
      return Error(ServerFailure(e.message));
    } catch (e) {
      return Error(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<UserProfile>> createProfile({
    required String id,
    required String name,
    required String phone,
    required String pincode,
    required List<String> roles,
  }) async {
    try {
      final profileData = {
        'id': id,
        'name': name,
        'phone': phone,
        'pincode': pincode,
        'roles': roles,
      };

      final data = await _client
          .from('profiles')
          .insert(profileData)
          .select()
          .single();

      return Success(UserProfile.fromJson(data));
    } on PostgrestException catch (e) {
      return Error(ServerFailure(e.message));
    } catch (e) {
      return Error(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _client.auth.signOut();
      return const Success(null);
    } on AuthException catch (e) {
      return Error(AuthFailure(e.message));
    } catch (e) {
      return Error(UnknownFailure(e.toString()));
    }
  }
}

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  final supabaseService = ref.read(supabaseServiceProvider);
  return AuthRepositoryImpl(supabaseService.client);
});
