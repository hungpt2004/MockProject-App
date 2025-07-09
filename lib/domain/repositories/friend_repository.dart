import 'package:vdiary_internship/data/models/user/user_model.dart';

abstract class FriendRepository {
  Future<List<UserModel>> findAllFriend();
  Future<List<UserModel>> findAllRequest();
  Future<Map<String, dynamic>> createRequest();
  Future<Map<String, dynamic>> deleteRequest();
  Future<Map<String, dynamic>> rejectRequest();
  Future<Map<String, dynamic>> unfriend();
  Future<Map<String, dynamic>> follow();
  Future<Map<String, dynamic>> unfollow();
}