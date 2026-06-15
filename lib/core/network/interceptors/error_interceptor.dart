import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  final Dio _dio;
  static const _maxRetries = 2;

  ErrorInterceptor(this._dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final shouldRetry = err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        (err.response?.statusCode ?? 0) >= 500;

    if (shouldRetry) {
      for (var i = 0; i < _maxRetries; i++) {
        await Future.delayed(Duration(milliseconds: 500 * (i + 1)));
        try {
          final response = await _dio.fetch(err.requestOptions);
          return handler.resolve(response);
        } catch (_) {
          continue;
        }
      }
    }
    handler.next(err);
  }
}
