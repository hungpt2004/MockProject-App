import 'package:mobx/mobx.dart';

part 'friend_store.g.dart';

class FriendStore = _FriendStore with _$FriendStore;

abstract class _FriendStore with Store {
  // Observable states
  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  ObservableList<Map<String, dynamic>> friends = ObservableList<Map<String, dynamic>>();

  @observable
  ObservableList<Map<String, dynamic>> friendRequests = ObservableList<Map<String, dynamic>>();

  @observable
  ObservableList<Map<String, dynamic>> sentRequests = ObservableList<Map<String, dynamic>>();

  @observable
  ObservableList<Map<String, dynamic>> suggestions = ObservableList<Map<String, dynamic>>();

  @observable
  String searchQuery = '';

  // Actions
  @action
  void setLoading(bool value) {
    isLoading = value;
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
  void setSearchQuery(String query) {
    searchQuery = query;
  }

  // CRUD Operations for Friends
  @action
  Future<void> loadFriends() async {
    try {
      setLoading(true);
      clearError();

      // TODO: Implement actual API call
      // final response = await apiService.getFriends();

      // Mock implementation
      await Future.delayed(Duration(seconds: 1));
      friends.clear();
    } catch (e) {
      setError('Không thể tải danh sách bạn bè: ${e.toString()}');
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<bool> removeFriend(int friendId) async {
    try {
      setLoading(true);
      clearError();

      // TODO: Implement actual API call
      // await apiService.removeFriend(friendId);

      // Mock implementation
      await Future.delayed(Duration(milliseconds: 500));
      friends.removeWhere((friend) => friend['id'] == friendId);
      return true;
    } catch (e) {
      setError('Không thể xóa bạn bè: ${e.toString()}');
      return false;
    } finally {
      setLoading(false);
    }
  }

  // Friend Requests Operations
  @action
  Future<void> loadFriendRequests() async {
    try {
      setLoading(true);
      clearError();

      // TODO: Implement actual API call
      // final response = await apiService.getFriendRequests();

      // Mock implementation
      await Future.delayed(Duration(seconds: 1));
      friendRequests.clear();
      friendRequests.addAll([
        {
          'id': 3,
          'name': 'Lê Văn C',
          'avatar': 'https://i.pinimg.com/736x/cb/4e/64/cb4e645d958ad62a7a2aed5209d56487.jpg',
          'email': 'c@example.com',
          'requestDate': DateTime.now().subtract(Duration(days: 1)),
        },
      ]);
    } catch (e) {
      setError('Không thể tải lời mời kết bạn: ${e.toString()}');
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<bool> acceptFriendRequest(int requestId) async {
    try {
      setLoading(true);
      clearError();

      // TODO: Implement actual API call
      // await apiService.acceptFriendRequest(requestId);

      // Mock implementation
      await Future.delayed(Duration(milliseconds: 500));
      
      // Move from requests to friends
      final request = friendRequests.firstWhere((req) => req['id'] == requestId);
      friendRequests.removeWhere((req) => req['id'] == requestId);
      
      friends.add({
        ...request,
        'isOnline': false,
        'lastSeen': DateTime.now(),
      });
      
      return true;
    } catch (e) {
      setError('Không thể chấp nhận lời mời: ${e.toString()}');
      return false;
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<bool> rejectFriendRequest(int requestId) async {
    try {
      setLoading(true);
      clearError();

      // TODO: Implement actual API call
      // await apiService.rejectFriendRequest(requestId);

      // Mock implementation
      await Future.delayed(Duration(milliseconds: 500));
      friendRequests.removeWhere((req) => req['id'] == requestId);
      return true;
    } catch (e) {
      setError('Không thể từ chối lời mời: ${e.toString()}');
      return false;
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<bool> sendFriendRequest(int userId) async {
    try {
      setLoading(true);
      clearError();

      // TODO: Implement actual API call
      // await apiService.sendFriendRequest(userId);

      // Mock implementation
      await Future.delayed(Duration(milliseconds: 500));
      
      // Move from suggestions to sent requests
      final user = suggestions.firstWhere((user) => user['id'] == userId);
      suggestions.removeWhere((user) => user['id'] == userId);
      
      sentRequests.add({
        ...user,
        'requestDate': DateTime.now(),
      });
      
      return true;
    } catch (e) {
      setError('Không thể gửi lời mời: ${e.toString()}');
      return false;
    } finally {
      setLoading(false);
    }
  }

  // Friend Suggestions
  @action
  Future<void> loadFriendSuggestions() async {
    try {
      setLoading(true);
      clearError();

      // TODO: Implement actual API call
      // final response = await apiService.getFriendSuggestions();

      // Mock implementation
      await Future.delayed(Duration(seconds: 1));
      suggestions.clear();
      suggestions.addAll([
        {
          'id': 4,
          'name': 'Phạm Thị D',
          'avatar': 'https://i.pinimg.com/736x/3f/18/28/3f1828dd47ac78756c5957fcb57c3849.jpg',
          'email': 'd@example.com',
          'mutualFriends': 5,
        },
        {
          'id': 5,
          'name': 'Hoàng Văn E',
          'avatar': 'https://i.pinimg.com/736x/4b/59/84/4b5984d18e93691f3ba7d894aefec9af.jpg',
          'email': 'e@example.com',
          'mutualFriends': 3,
        },
      ]);
    } catch (e) {
      setError('Không thể tải gợi ý kết bạn: ${e.toString()}');
    } finally {
      setLoading(false);
    }
  }

  // Search functionality
  @action
  Future<void> searchUsers(String query) async {
    if (query.isEmpty) {
      setSearchQuery('');
      return;
    }

    try {
      setLoading(true);
      clearError();
      setSearchQuery(query);

      // TODO: Implement actual API call
      // final response = await apiService.searchUsers(query);

      // Mock implementation
      await Future.delayed(Duration(milliseconds: 800));
      
      // Filter existing data based on search query
      // In real implementation, this would be server-side search
      
    } catch (e) {
      setError('Không thể tìm kiếm: ${e.toString()}');
    } finally {
      setLoading(false);
    }
  }

  // Computed values
  @computed
  List<Map<String, dynamic>> get filteredFriends {
    if (searchQuery.isEmpty) return friends;
    return friends.where((friend) =>
      friend['name'].toLowerCase().contains(searchQuery.toLowerCase()) ||
      friend['email'].toLowerCase().contains(searchQuery.toLowerCase())
    ).toList();
  }

  @computed
  List<Map<String, dynamic>> get filteredSuggestions {
    if (searchQuery.isEmpty) return suggestions;
    return suggestions.where((user) =>
      user['name'].toLowerCase().contains(searchQuery.toLowerCase()) ||
      user['email'].toLowerCase().contains(searchQuery.toLowerCase())
    ).toList();
  }

  @computed
  int get friendsCount => friends.length;

  @computed
  int get pendingRequestsCount => friendRequests.length;

  @computed
  bool get hasError => errorMessage != null;

  // Initialize all data
  @action
  Future<void> initialize() async {
    await Future.wait([
      loadFriends(),
      loadFriendRequests(),
      loadFriendSuggestions(),
    ]);
  }
}
