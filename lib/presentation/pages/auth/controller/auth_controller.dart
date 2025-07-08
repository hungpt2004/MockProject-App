import 'package:mobx/mobx.dart';
import 'package:vdiary_internship/data/models/province/province_model.dart';
import 'package:vdiary_internship/data/services/local_storage/shared_preferences_service.dart';
import 'package:vdiary_internship/data/services/province_service/province_service.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  final ProvinceService _provinceService = ProvinceService();

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
  String email = '';

  @observable
  String password = '';

  @observable
  bool isRememberMe = false;

  // User info
  @observable
  Map<String, dynamic>? userInfo;

  // Actions
  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setListProvinces(List<ProvinceModel> list) {
    listProvinces = list;
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

      // TODO: Gọi API Đăng nhập

      // Mock implementation
      await Future.delayed(Duration(seconds: 2));
      if (email.isNotEmpty && password.isNotEmpty) {
        isLoggedIn = true;

        // Lưu dữ liệu vào local storage
        if (isRememberMe) {
          await SharedPreferencesService.setEmail(email);
          await SharedPreferencesService.setPassword(password);
          await SharedPreferencesService.setRememberMe(isRememberMe);
          await SharedPreferencesService.setLoginStatus(true);
        }

        return true;
      } else {
        setError('Email và password không được để trống');
        return false;
      }
    } catch (e) {
      setError('Đăng nhập thất bại: ${e.toString()}');
      return false;
    } finally {
      setLoading(false);
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

      if (password != confirmPassword) {
        setError('Mật khẩu xác nhận không khớp');
        return false;
      }

      // TODO: Xử lý API đăng ký

      // Mock implementation
      await Future.delayed(Duration(seconds: 2));
      return true;
    } catch (e) {
      setError('Đăng ký thất bại: ${e.toString()}');
      return false;
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<void> logout() async {
    try {
      setLoading(true);

      // Xóa data login trong local-storage
      await SharedPreferencesService.clearDataLogin();

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

  // Computed values
  @computed
  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;

  @computed
  bool get hasError => errorMessage != null;
}
