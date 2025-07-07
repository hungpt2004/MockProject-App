// Định nghĩa cho trường hợp API trả về data là 1 object
class ApiSingleResponse<T> {
  final String status;
  final T data;
  ApiSingleResponse({required this.status, required this.data});
  factory ApiSingleResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return ApiSingleResponse(
      status: json['status'],
      data: fromJsonT(json['data']),
    );
  }
}
