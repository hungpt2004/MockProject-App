import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:vdiary_internship/data/services/local_storage/shared_preferences_service.dart';

class DioInterceptorConfig extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await SharedPreferencesService.getAccessToken();
    debugPrint('Token từ user middleware: $token');
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }
}
