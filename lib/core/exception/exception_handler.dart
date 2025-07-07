
import 'package:dio/dio.dart';
import 'exception_base.dart';
import 'exception_type.dart';

class ExceptionHandler {
  static AppExceptionBase handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException();

      case DioExceptionType.connectionError:
        return NoInternetException();

      case DioExceptionType.badResponse:
        return _handleStatusCode(error);

      case DioExceptionType.cancel:
        return NetWorkException(
          errorMessage: 'Request was cancelled',
          code: 'REQUEST_CANCELLED',
        );

      default:
        return NetWorkException(
          errorMessage: 'Something went wrong',
          code: 'UNKNOWN_ERROR',
        );
    }
  }

  static AppExceptionBase _handleStatusCode(DioException error) {
    final statusCode = error.response?.statusCode;
    final message = error.response?.data?['message'] ?? 'Unknown error';

    switch (statusCode) {
      case 400:
        return BadRequestException(errorMessage: message, code: 'BAD_REQUEST');
      case 401:
        return UnauthorizedException(errorMessage: message, code: 'UNAUTHORIZED');
      case 403:
        return AuthException(errorMessage: 'Access forbidden', code: 'FORBIDDEN');
      case 404:
        return ServerException(errorMessage: 'Resource not found', code: 'NOT_FOUND');
      case 500:
        return InternalServerException(errorMessage: message, code: 'INTERNAL_SERVER_ERROR');
      default:
        return ServerException(
          errorMessage: message,
          code: 'SERVER_ERROR_$statusCode',
        );
    }
  }
}