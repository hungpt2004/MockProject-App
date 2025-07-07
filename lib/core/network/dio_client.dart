import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vdiary_internship/core/network/interceptors/dio_interceptor_config.dart';

class DioClient {

  // Tạo dio client để tương tác mà không có header token
  static Dio createPublicDio() {
    final dio = Dio(BaseOptions(
      baseUrl: dotenv.env['SERVER_URL'] ?? '',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));

    dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true)
    );
    
    return dio;
  }

  // Dio client có header token của user
  static Dio createPrivateDio(Future<String?> Function() getToken) {
    final dio = Dio(BaseOptions(
      baseUrl: dotenv.env['SERVER_URL'] ?? '',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));

    dio.interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
      DioInterceptorConfig(getToken), 
    ]);

    return dio;
  }
}