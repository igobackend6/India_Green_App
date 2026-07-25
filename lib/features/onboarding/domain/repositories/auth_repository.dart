import 'dart:io';

import '../../../../core/utils/result.dart';
import '../entities/user_profile.dart';

abstract class IAuthRepository {
  Future<Result<void>> sendOtp(String phone);
  Future<Result<void>> verifyOtp(String phone, String otp);
  Future<Result<UserProfile?>> getProfile(String userId);
  Future<Result<UserProfile>> createProfile({
    required String id,
    required String name,
    required String phone,
    required String pincode,
    required List<String> roles,
  });
  Future<Result<String>> uploadAvatar({
    required String userId,
    required File imageFile,
  });
  Future<Result<void>> removeAvatar({required String userId});
  Future<Result<void>> logout();
}
