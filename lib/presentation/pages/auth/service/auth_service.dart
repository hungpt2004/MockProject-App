import 'package:vdiary_internship/data/repositories_impl/auth_repository_impl.dart';

class AuthService {
  final AuthRepositoryImpl _authRepositoryImpl = AuthRepositoryImpl();

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    try {
      final response = await _authRepositoryImpl.signIn(email, password);
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> signUp(
    String name,
    String email,
    String password,
  ) async {
    try {
      final response = await _authRepositoryImpl.signUp(name, email, password);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
