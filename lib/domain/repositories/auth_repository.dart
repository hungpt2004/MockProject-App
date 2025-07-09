import 'package:vdiary_internship/data/models/user/user_model.dart';

abstract class AuthRepository {
  Future<List<UserModel>> findAll(); 
  Future<UserModel> findById(String id);
  Future<Map<String, dynamic>> signIn(String email, String password);
  Future<Map<String, dynamic>> signUp(String name, String email, String password);
}