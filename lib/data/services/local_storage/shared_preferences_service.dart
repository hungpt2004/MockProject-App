import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/storage/key_local_storage.dart';

class SharedPreferencesService {

  // khởi tạo biến instance
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Hàm set
  static Future<void> setRememberMe(bool value) async {
    await _preferences?.setBool(KeyLocalStorage.keyRememberMe, value);
  }

  // Hàm get
  static bool? getRememberMe() {
    return _preferences?.getBool(KeyLocalStorage.keyRememberMe);
  }

  // Hàm set email
  static Future<void> setEmail(String email) async {
    await _preferences?.setString(KeyLocalStorage.keyEmail, email);
  }

  // Hàm get email
  static String? getEmail(){
    return _preferences?.getString(KeyLocalStorage.keyEmail);
  }

  // Hàm set password
  static Future<void> setPassword(String password) async {
    await _preferences?.setString(KeyLocalStorage.keyPassword, password);
  }

  // Hàm get password
  static String? getPassword(){
    return _preferences?.getString(KeyLocalStorage.keyPassword);
  }

  static Future<void> setLoginStatus(bool value) async {
    await _preferences?.setBool(KeyLocalStorage.keyIsLoggedIn, value);
  }

  static bool? getLoginStatus() {
    return _preferences?.getBool(KeyLocalStorage.keyIsLoggedIn);
  }

  static Future<void> clearLocalStorage() async {
    await _preferences?.clear();
  }

  // Hàm clear data login nhưng giữ lại data remember
  static Future<void> clearDataLogin() async {
    await _preferences?.remove(KeyLocalStorage.keyIsLoggedIn);

    // Nếu user nhấn remember
    if(!(getRememberMe() ?? false)) {
      // xóa email và password
      await _preferences?.remove(KeyLocalStorage.keyEmail);
      await _preferences?.remove(KeyLocalStorage.keyPassword);
    }

  }

  static Future<void> setAccessToken(String token) async {
    await _preferences?.setString(KeyLocalStorage.keyUserToken, token);
  }

  static Future<String?> getAccessToken() async {
    return _preferences?.getString(KeyLocalStorage.keyUserToken);
  }

}