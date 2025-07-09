import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vdiary_internship/core/constants/api/end_point.dart';
import 'package:vdiary_internship/core/network/interceptors/dio_interceptor_config.dart';

class DioClient {

  // Tạo dio client để tương tác mà không có header token
  static Dio createPublicDio() {
    debugPrint('BASE-URL: $baseUrl');
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));

    dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true)
    );
    
    return dio;
  }

  // Dio client có header token của user
  static Dio createPrivateDio() {
    debugPrint('BASE-URL:$baseUrl');
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));

    dio.interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
      DioInterceptorConfig(), 
    ]);

    return dio;
  }
}