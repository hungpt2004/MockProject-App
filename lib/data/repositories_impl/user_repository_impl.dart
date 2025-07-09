import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:vdiary_internship/core/constants/api/end_point.dart';
import 'package:vdiary_internship/core/exception/exception_base.dart';
import 'package:vdiary_internship/core/exception/exception_handler.dart';
import 'package:vdiary_internship/core/exception/exception_type.dart';
import 'package:vdiary_internship/core/network/dio_client.dart';
import 'package:vdiary_internship/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Map<String, dynamic>> findAllUser(String userId) async {
    try {
      var response = await DioClient.createPublicDio().get('${ApiEndPoint.findAllUser}/$userId');
      return response.data;
    } on DioException catch (error) {
      throw ExceptionHandler.handleDioException(error);
    } catch (error) {
      debugPrint(error.toString());
      if(error is AppExceptionBase) rethrow;
      throw ServerException(errorMessage: 'Lỗi không xác định ${error.toString()}', code: 'UNKNOWN_ERROR');
    }
  }

  @override
  Future<Map<String, dynamic>> findOneById() {
    // TODO: implement findOneById
    throw UnimplementedError();
  }
}