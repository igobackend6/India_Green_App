import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/app_config.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

/// Singleton Dio client with interceptors for logging, retry, and auth.
final dioClientProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: AppConfig.baseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  dio.interceptors.addAll([
    AuthInterceptor(),
    LoggingInterceptor(),
    ErrorInterceptor(dio),
  ]);

  return dio;
});

/// API endpoint URL constants.
abstract final class ApiEndpoints {
  static const geminiBase =
      'https://generativelanguage.googleapis.com/v1beta/models';
  static String geminiChat(String model) => '$geminiBase/$model:generateContent';

  static const products    = '/api/v1/market/products';
  static const mandiPrices = '/api/v1/mandi/prices';
  static const wallet      = '/api/v1/finance/wallet';
  static const loans       = '/api/v1/finance/loans';
  static const govtSchemes = '/api/v1/finance/schemes';
  static const courses     = '/api/v1/learn/courses';
  static const jobs        = '/api/v1/jobs';
  static const sendOtp     = '/api/v1/auth/send-otp';
  static const verifyOtp   = '/api/v1/auth/verify-otp';
}

/// Sealed API result type for consistent error handling.
sealed class ApiResult<T> {
  const ApiResult();
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  const ApiSuccess(this.data);
}

class ApiFailure<T> extends ApiResult<T> {
  final ApiException error;
  const ApiFailure(this.error);
}

/// Typed exception hierarchy for clear error semantics.
sealed class ApiException implements Exception {
  final String message;
  final int? statusCode;
  const ApiException(this.message, {this.statusCode});

  @override
  String toString() => 'ApiException($statusCode): $message';
}

class NetworkException extends ApiException {
  const NetworkException([super.message = 'No internet connection']);
}

class ServerException extends ApiException {
  const ServerException(super.message, {super.statusCode});
}

class TimeoutApiException extends ApiException {
  const TimeoutApiException() : super('Request timed out');
}

class ParseException extends ApiException {
  const ParseException([super.message = 'Failed to parse response']);
}

/// Maps Dio errors into our typed exception hierarchy.
ApiException mapDioError(DioException e) {
  return switch (e.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.sendTimeout =>
      const TimeoutApiException(),
    DioExceptionType.connectionError => const NetworkException(),
    _ => ServerException(
        e.response?.statusMessage ?? 'Unknown error',
        statusCode: e.response?.statusCode,
      ),
  };
}
