import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:vdiary_internship/data/models/province/province_model.dart';
import 'package:vdiary_internship/data/models/user/user_model.dart';
import 'package:vdiary_internship/data/services/local_storage/shared_preferences_service.dart';
import 'package:vdiary_internship/data/services/province_service/province_service.dart';
import 'package:vdiary_internship/presentation/pages/auth/service/auth_service.dart';
import 'package:vdiary_internship/presentation/routes/app_navigator.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final ProvinceService _provinceService = ProvinceService();
  final AuthService _authService = AuthService();

  @observable
  List<ProvinceModel>? listProvinces;

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingProvince = false;

  @observable
  bool isLoggedIn = false;

  @observable
  String? token;

  @observable
  String? errorMessage;

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isRememberMe = false;

  @observable
  String? successMessage;

  @observable
  Map<String, dynamic>? userInfo;

  @action
  void setName(String value) {
    name = value;
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setListProvinces(List<ProvinceModel> list) {
    listProvinces = list;
  }

  @action
  void setSuccessMessage(String? value) {
    successMessage = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setRememberMe(bool value) {
    isRememberMe = value;
  }

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  void setLoadingProvinces(bool value) {
    isLoadingProvince = value;
  }

  @action
  void setError(String? error) {
    errorMessage = error;
  }

  @action
  void clearError() {
    errorMessage = null;
  }

  @action
  void loadSavedCredentials() {
    isRememberMe = SharedPreferencesService.getRememberMe() ?? false;
    if (isRememberMe) {
      email = SharedPreferencesService.getEmail() ?? '';
      password = SharedPreferencesService.getPassword() ?? '';
    }
  }

  @action
  Future<void> loadVietNamProvinces() async {
    try {
      clearError();
      var fetchData = await _provinceService.getVietNamProvinces();
      setListProvinces(fetchData);
    } catch (error) {
      setError(error.toString());
    } finally {
      setLoadingProvinces(false);
    }
  }

  // API Methods
  @action
  Future<bool> login() async {
    try {
      setLoading(true);
      clearError();

      final response = await _authService.signIn(email, password);
      final success = response['success'] as bool? ?? false;
      final message = response['message'] as String? ?? '';
      final token = response['token'] as String? ?? '';

      debugPrint('Trạng thái đăng nhập: $success');
      debugPrint('Message đăng nhập: $message');
      debugPrint('Token: $token');
      debugPrint('User: ${response['user']}');

      // Kiểm tra success
      if (success == true) {
        setSuccessMessage(message);
        if (email.isNotEmpty && password.isNotEmpty) {
          isLoggedIn = true;

          // Lưu dữ liệu vào local storage
          if (isRememberMe) {
            await SharedPreferencesService.setEmail(email);
            await SharedPreferencesService.setPassword(password);
            await SharedPreferencesService.setRememberMe(isRememberMe);
            await SharedPreferencesService.setLoginStatus(true);
          }

          // Lưu vào local storage token
          await SharedPreferencesService.setAccessToken(token);
          // Convert json về object
          final userModel = UserModel.fromJson(
            response['user'] as Map<String, dynamic>,
          );
          userInfo = userModel.toJson();
          debugPrint('User hiện tại đăng nhập: $userInfo');

          return true;
        } else {
          return false;
        }
      } else {
        debugPrint('hehe');
        setError(message.isNotEmpty ? message : 'Không tìm thấy người dùng');
        debugPrint('Tin nhắn lỗi $errorMessage');
        return false;
      }
    } catch (e) {
      setError('Account not found');
      return false;
    } finally {
      await Future.delayed(Duration(seconds: 2), () => setLoading(false));
    }
  }

  @action
  Future<bool> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      setLoading(true);
      clearError();

      print('Name: $name');
      print('Email: $email');
      print('Password: $password');
      print('Confirm Password: $confirmPassword');

      if (password != confirmPassword) {
        setError('Mật khẩu xác nhận không khớp');
        return false;
      }

      final response = await _authService.signUp(name, email, password);
      final success = response['success'] as bool? ?? false;
      final message = response['message'] as String? ?? '';

      print('Success trả về: $success');
      print('Message trả về: $message');

      if (success) {
        setSuccessMessage(message);
        final userData = response['data'];
        if (userData != null) {
          try {
            final userModel = UserModel.fromJson(
              userData as Map<String, dynamic>,
            );
            userInfo = userModel.toJson();
            debugPrint('User hiện tại đăng nhập: $userInfo');
          } catch (error) {
            print('Lỗi khi parsing user data: $error');
          }
        }
        return true;
      } else {
        setError(message.isNotEmpty ? message : 'Đăng ký thất bại');
        return false;
      }
    } catch (e) {
      setError('Đăng ký thất bại: ${e.toString()}');
      return false;
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<void> logout(BuildContext context) async {
    try {
      setLoading(true);

      // Xóa data login trong local-storage
      await SharedPreferencesService.clearDataLogin();

      // Về trang sign in
      AppNavigator.goNamed(context, 'signin');

      // Clear user data
      token = null;
      userInfo = null;
      isLoggedIn = false;
      email = '';
      password = '';
    } catch (e) {
      setError('Đăng xuất thất bại: ${e.toString()}');
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<bool> forgotPassword(String email) async {
    try {
      setLoading(true);
      clearError();

      // TODO: Implement actual API call
      // await apiService.forgotPassword(email);

      // Mock implementation
      await Future.delayed(Duration(seconds: 1));
      return true;
    } catch (e) {
      setError('Gửi email thất bại: ${e.toString()}');
      return false;
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<bool> resetPassword(String token, String newPassword) async {
    try {
      setLoading(true);
      clearError();

      // TODO: Implement actual API call
      // await apiService.resetPassword(token, newPassword);

      // Mock implementation
      await Future.delayed(Duration(seconds: 1));
      return true;
    } catch (e) {
      setError('Đặt lại mật khẩu thất bại: ${e.toString()}');
      return false;
    } finally {
      setLoading(false);
    }
  }

  // Kiểm tra xem form login có thiếu gì không
  @computed
  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;

  // Kiểm tra có lỗi hoặc không trả về bool
  @computed
  bool get hasError => errorMessage != null;
}
