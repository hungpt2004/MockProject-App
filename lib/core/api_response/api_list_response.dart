// Định nghĩa cho trường hợp API trả về một [] dữ liệu
class ApiListResponse<T> {
  final String status;
  final List<T> data;

  ApiListResponse({required this.status, required this.data});

  factory ApiListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    
    // Đưa data về list
    var dataList = (json['data'] as List).map((item) => fromJsonT(item)).toList();

    return ApiListResponse(status: json['status'], data: dataList);
  }
}
