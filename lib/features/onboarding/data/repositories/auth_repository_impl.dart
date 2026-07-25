import 'dart:io';

import 'package:flutter/foundation.dart';
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

  static const _bucket = 'avatars';

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

      if (data == null) return const Success(null);
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
  Future<Result<String>> uploadAvatar({
    required String userId,
    required File imageFile,
  }) async {
    try {
      final filePath = '$userId/profile.jpg';
      debugPrint('[Avatar] Uploading to bucket=$_bucket path=$filePath');

      final bytes = await imageFile.readAsBytes();
      debugPrint('[Avatar] File size: ${bytes.lengthInBytes} bytes');

      // Step 1: Upload to Supabase Storage (upsert replaces existing file)
      try {
        await _client.storage.from(_bucket).uploadBinary(
              filePath,
              bytes,
              fileOptions: const FileOptions(
                contentType: 'image/jpeg',
                upsert: true,
              ),
            );
        debugPrint('[Avatar] Storage upload succeeded');
      } on StorageException catch (e) {
        debugPrint('[Avatar] Storage upload failed: ${e.message} | statusCode=${e.statusCode}');
        return Error(ServerFailure('Storage upload failed: ${e.message}'));
      }

      // Step 2: Get the public URL
      final publicUrl = _client.storage.from(_bucket).getPublicUrl(filePath);
      // Append cache-bust so CachedNetworkImage fetches the new image
      final cacheBusted = '$publicUrl?t=${DateTime.now().millisecondsSinceEpoch}';
      debugPrint('[Avatar] Public URL: $cacheBusted');

      // Step 3: Persist URL to profiles table
      try {
        await _client
            .from('profiles')
            .update({'avatar_url': cacheBusted})
            .eq('id', userId);
        debugPrint('[Avatar] Profile table updated');
      } on PostgrestException catch (e) {
        debugPrint('[Avatar] Profile update failed: ${e.message} | code=${e.code}');
        return Error(ServerFailure('Profile update failed: ${e.message}'));
      }

      return Success(cacheBusted);
    } catch (e, st) {
      debugPrint('[Avatar] Unexpected error: $e\n$st');
      return Error(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> removeAvatar({required String userId}) async {
    try {
      final filePath = '$userId/profile.jpg';
      debugPrint('[Avatar] Removing $filePath from bucket=$_bucket');

      // Remove from storage (ignore error if file didn't exist)
      try {
        await _client.storage.from(_bucket).remove([filePath]);
        debugPrint('[Avatar] Storage file removed');
      } on StorageException catch (e) {
        debugPrint('[Avatar] Storage remove warning (ignored): ${e.message}');
      }

      // Clear URL from profiles table
      await _client
          .from('profiles')
          .update({'avatar_url': null})
          .eq('id', userId);
      debugPrint('[Avatar] Profile avatar_url cleared');

      return const Success(null);
    } on PostgrestException catch (e) {
      debugPrint('[Avatar] Remove profile update failed: ${e.message}');
      return Error(ServerFailure(e.message));
    } catch (e) {
      debugPrint('[Avatar] Remove unexpected error: $e');
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
