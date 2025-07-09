import 'package:vdiary_internship/data/models/user/user_model.dart';
import 'package:vdiary_internship/domain/repositories/friend_repository.dart';

class FriendRepositoryImpl implements FriendRepository {
  @override
  Future<Map<String, dynamic>> createRequest() {
    // TODO: implement createRequest
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> deleteRequest() {
    // TODO: implement deleteRequest
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> findAllFriend() {
    // TODO: implement findAllFriend
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> findAllRequest() {
    // TODO: implement findAllRequest
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> follow() {
    // TODO: implement follow
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> rejectRequest() {
    // TODO: implement rejectRequest
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> unfollow() {
    // TODO: implement unfollow
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> unfriend() {
    // TODO: implement unfriend
    throw UnimplementedError();
  }
}