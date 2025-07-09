// Định nghĩa cho trường hợp API trả về data là 1 object
class ApiSingleResponse<T> {
  final bool success;
  final String message;
  final T? data;
  ApiSingleResponse({
    required this.success,
    required this.message,
    this.data
  });
  factory ApiSingleResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return ApiSingleResponse<T>(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: json['data'] != null && fromJsonT != null
      ? fromJsonT(json['data'] as Map<String, dynamic>)
      : null
    );
  }
}
