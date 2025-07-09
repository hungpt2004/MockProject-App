abstract class UserRepository {
  Future<Map<String, dynamic>> findAllUser(String userId);
  Future<Map<String, dynamic>> findOneById();
}