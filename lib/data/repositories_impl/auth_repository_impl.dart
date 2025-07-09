import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vdiary_internship/core/api_response/api_list_response.dart';
import 'package:vdiary_internship/core/constants/api/end_point.dart';
import 'package:vdiary_internship/core/exception/exception_handler.dart';
import 'package:vdiary_internship/core/exception/exception_type.dart';
import 'package:vdiary_internship/core/network/dio_client.dart';
import 'package:vdiary_internship/data/models/user/user_model.dart';
import 'package:vdiary_internship/data/services/local_storage/shared_preferences_service.dart';
import 'package:vdiary_internship/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<List<UserModel>> findAll() async {
    try {
      var response = await DioClient.createPublicDio().get(
        ApiEndPoint.findAllUser,
      );
      ApiListResponse<UserModel> apiResponse = ApiListResponse.fromJson(
        response.data,
        (json) => UserModel.fromJson(json),
      );
      if (apiResponse.status == true) {
        return apiResponse.data;
      } else {
        throw ServerException(
          errorMessage: 'Lỗi server khi lấy tất cả người dùng',
          code: '500',
        );
      }
    } on DioException catch (error) {
      debugPrint(error.toString());
      throw ExceptionHandler.handleDioException(error);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<UserModel> findById(String id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> signIn(String email, String password) async {
    print(email);
    print(password);
    try {
      // Api trả về id, name, email
      var response = await DioClient.createPublicDio().post(
        ApiEndPoint.signIn,
        data: {'email': email, 'password': password},
      );
      return response.data;
    } catch (error) {
      throw ServerException(errorMessage: error.toString(), code: '500');
    }
  }

  @override
  Future<Map<String, dynamic>> signUp(
    String name,
    String email,
    String password,
  ) async {
    try {
      var response = await DioClient.createPublicDio().post(
        ApiEndPoint.signUp,
        data: {'name': name, 'email': email, 'password': password},
      );
      return response.data;
    } catch (error) {
      throw ServerException(errorMessage: error.toString(), code: '500');
    }
  }
}
