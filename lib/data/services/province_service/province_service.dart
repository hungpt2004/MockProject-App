import 'package:dio/dio.dart';
import 'package:vdiary_internship/core/constants/api/base_url.dart';
import 'package:vdiary_internship/core/exception/exception_type.dart';
import 'package:vdiary_internship/data/models/province/province_model.dart';

class ProvinceService {

  final Dio _dio = Dio();

  // Hàm lấy tên các tỉnh thành ở Việt Nam
  Future<List<ProvinceModel>> getVietNamProvinces() async {
    try {
      print('🔍 Bắt đầu gọi API: ${BaseUrl.provinceUrl}');
      
      final response = await _dio.get(
        BaseUrl.provinceUrl,
      );
      
      print('🔍 Status code: ${response.statusCode}');
      print('🔍 Response data type: ${response.data.runtimeType}');
      print('🔍 Response data: ${response.data}');
      
      if (response.statusCode == 200) {
        // ✅ Kiểm tra xem data có phải là List không
        if (response.data is List) {
          final List<dynamic> data = response.data;
          print('🔍 Data length: ${data.length}');
          
          // ✅ Kiểm tra phần tử đầu tiên
          if (data.isNotEmpty) {
            print('🔍 First item: ${data[0]}');
            print('🔍 First item type: ${data[0].runtimeType}');
          }
          
          final List<ProvinceModel> provinces = data
              .map((json) => ProvinceModel.fromJson(json as Map<String, dynamic>))
              .toList();
          
          print('🔍 Provinces parsed: ${provinces.length}');
          print('🔍 First province: ${provinces.isNotEmpty ? provinces[0].name : 'None'}');
          
          return provinces;
        } else {
          // ✅ Nếu data không phải List, có thể là Object chứa List
          print('🔍 Data is not a List, checking if it contains a List...');
          
          if (response.data is Map<String, dynamic>) {
            final Map<String, dynamic> dataMap = response.data;
            print('🔍 Data map keys: ${dataMap.keys.toList()}');
            
            // Thử các key phổ biến
            if (dataMap.containsKey('data')) {
              final List<dynamic> data = dataMap['data'];
              return data.map((json) => ProvinceModel.fromJson(json as Map<String, dynamic>)).toList();
            } else if (dataMap.containsKey('results')) {
              final List<dynamic> data = dataMap['results'];
              return data.map((json) => ProvinceModel.fromJson(json as Map<String, dynamic>)).toList();
            }
          }
          
          throw ServerException(errorMessage: 'Định dạng dữ liệu không đúng', code: '400');
        }
      } else {
        throw ServerException(errorMessage: 'Lỗi server: ${response.statusCode}', code: '${response.statusCode}');
      }
    } catch (e) {
      print('🔥 Error in getVietNamProvinces: $e');
      throw ServerException(errorMessage: e.toString(), code: '500');
    }
  }
}