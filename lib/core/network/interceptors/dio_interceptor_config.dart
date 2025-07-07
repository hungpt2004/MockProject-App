import 'package:dio/dio.dart';

class DioInterceptorConfig extends Interceptor {
  final Future<String?> Function() getToken;

  DioInterceptorConfig(this.getToken);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }
}
