import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  // Ideally inject a token provider or read from storage here
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final token = ... get token ...
    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }
    handler.next(options);
  }
}
