import '../../../../core/utils/result.dart';
import '../entities/user_profile.dart';

abstract class IAuthRepository {
  /// Sends an OTP to the given phone number.
  Future<Result<void>> sendOtp(String phone);

  /// Verifies the OTP.
  Future<Result<void>> verifyOtp(String phone, String otp);

  /// Fetches the user profile by user ID.
  Future<Result<UserProfile?>> getProfile(String userId);

  /// Creates a new user profile.
  Future<Result<UserProfile>> createProfile({
    required String id,
    required String name,
    required String phone,
    required String pincode,
    required List<String> roles,
  });

  /// Logs the user out.
  Future<Result<void>> logout();
}
