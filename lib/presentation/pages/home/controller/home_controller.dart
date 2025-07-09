import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  // Observable states
  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  ObservableList<Map<String, dynamic>> posts = ObservableList<Map<String, dynamic>>();

  @observable
  ObservableList<Map<String, dynamic>> stories = ObservableList<Map<String, dynamic>>();

  @observable
  bool isRefreshing = false;

  @observable
  bool hasMorePosts = true;

  @observable
  int currentPage = 1;

  // Actions
  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  void setRefreshing(bool value) {
    isRefreshing = value;
  }

  @action
  void setError(String? error) {
    errorMessage = error;
  }

  @action
  void clearError() {
    errorMessage = null;
  }

  // Posts CRUD Operations
  @action
  Future<void> loadPosts({bool refresh = false}) async {
    try {
      if (refresh) {
        setRefreshing(true);
        currentPage = 1;
        hasMorePosts = true;
      } else {
        setLoading(true);
      }
      
      clearError();

      // TODO: Implement actual API call
      // final response = await apiService.getPosts(page: currentPage);

      // Mock implementation
      await Future.delayed(Duration(seconds: 1));
      
      final mockPosts = [
        {
          'id': DateTime.now().millisecondsSinceEpoch + 1,
          'userId': 1,
          'userName': 'Nguyễn Văn A',
          'userAvatar': 'https://i.pinimg.com/736x/3f/18/28/3f1828dd47ac78756c5957fcb57c3849.jpg',
          'content': 'Hôm nay thật là một ngày tuyệt vời! 🌞',
          'image': 'https://i.pinimg.com/736x/cb/4e/64/cb4e645d958ad62a7a2aed5209d56487.jpg',
          'createdAt': DateTime.now().subtract(Duration(hours: 2)),
          'likes': 15,
          'comments': 3,
          'shares': 1,
          'isLiked': false,
        },
        {
          'id': DateTime.now().millisecondsSinceEpoch + 2,
          'userId': 2,
          'userName': 'Trần Thị B',
          'userAvatar': 'https://i.pinimg.com/736x/4b/59/84/4b5984d18e93691f3ba7d894aefec9af.jpg',
          'content': 'Chia sẻ một số tips học Flutter hiệu quả...',
          'image': null,
          'createdAt': DateTime.now().subtract(Duration(hours: 5)),
          'likes': 28,
          'comments': 7,
          'shares': 5,
          'isLiked': true,
        },
      ];

      if (refresh) {
        posts.clear();
      }
      
      posts.addAll(mockPosts);
      currentPage++;
      
      // Simulate no more posts after page 3
      if (currentPage > 3) {
        hasMorePosts = false;
      }
      
    } catch (e) {
      setError('Không thể tải bài viết: ${e.toString()}');
    } finally {
      setLoading(false);
      setRefreshing(false);
    }
  }

  @action
  Future<bool> createPost(String content, {String? imagePath}) async {
    try {
      setLoading(true);
      clearError();

      // TODO: Implement actual API call
      // final response = await apiService.createPost(content, imagePath);

      // Mock implementation
      await Future.delayed(Duration(seconds: 2));
      
      final newPost = {
        'id': DateTime.now().millisecondsSinceEpoch,
        'userId': 999, // Current user ID
        'userName': 'Bạn',
        'userAvatar': 'https://i.pinimg.com/736x/3f/18/28/3f1828dd47ac78756c5957fcb57c3849.jpg',
        'content': content,
        'image': imagePath,
        'createdAt': DateTime.now(),
        'likes': 0,
        'comments': 0,
        'shares': 0,
        'isLiked': false,
      };
      
      posts.insert(0, newPost); // Add to top
      return true;
    } catch (e) {
      setError('Không thể tạo bài viết: ${e.toString()}');
      return false;
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<bool> updatePost(int postId, String newContent) async {
    try {
      setLoading(true);
      clearError();

      // TODO: Implement actual API call
      // await apiService.updatePost(postId, newContent);

      // Mock implementation
      await Future.delayed(Duration(seconds: 1));
      
      final index = posts.indexWhere((post) => post['id'] == postId);
      if (index != -1) {
        posts[index] = {
          ...posts[index],
          'content': newContent,
          'updatedAt': DateTime.now(),
        };
      }
      
      return true;
    } catch (e) {
      setError('Không thể cập nhật bài viết: ${e.toString()}');
      return false;
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<bool> deletePost(int postId) async {
    try {
      setLoading(true);
      clearError();

      // TODO: Implement actual API call
      // await apiService.deletePost(postId);

      // Mock implementation
      await Future.delayed(Duration(seconds: 1));
      posts.removeWhere((post) => post['id'] == postId);
      return true;
    } catch (e) {
      setError('Không thể xóa bài viết: ${e.toString()}');
      return false;
    } finally {
      setLoading(false);
    }
  }

  // Post Interactions
  @action
  Future<bool> toggleLike(int postId) async {
    try {
      // Optimistic update
      final index = posts.indexWhere((post) => post['id'] == postId);
      if (index != -1) {
        final currentLiked = posts[index]['isLiked'] as bool;
        final currentLikes = posts[index]['likes'] as int;
        
        posts[index] = {
          ...posts[index],
          'isLiked': !currentLiked,
          'likes': currentLiked ? currentLikes - 1 : currentLikes + 1,
        };
      }

      // TODO: Implement actual API call
      // await apiService.toggleLike(postId);

      // Mock API call
      await Future.delayed(Duration(milliseconds: 300));
      return true;
    } catch (e) {
      // Revert optimistic update on error
      final index = posts.indexWhere((post) => post['id'] == postId);
      if (index != -1) {
        final currentLiked = posts[index]['isLiked'] as bool;
        final currentLikes = posts[index]['likes'] as int;
        
        posts[index] = {
          ...posts[index],
          'isLiked': !currentLiked,
          'likes': currentLiked ? currentLikes - 1 : currentLikes + 1,
        };
      }
      
      setError('Không thể thích bài viết: ${e.toString()}');
      return false;
    }
  }

  @action
  Future<bool> sharePost(int postId) async {
    try {
      // Optimistic update
      final index = posts.indexWhere((post) => post['id'] == postId);
      if (index != -1) {
        final currentShares = posts[index]['shares'] as int;
        posts[index] = {
          ...posts[index],
          'shares': currentShares + 1,
        };
      }

      // TODO: Implement actual API call
      // await apiService.sharePost(postId);

      // Mock API call
      await Future.delayed(Duration(milliseconds: 500));
      return true;
    } catch (e) {
      // Revert optimistic update on error
      final index = posts.indexWhere((post) => post['id'] == postId);
      if (index != -1) {
        final currentShares = posts[index]['shares'] as int;
        posts[index] = {
          ...posts[index],
          'shares': currentShares - 1,
        };
      }
      
      setError('Không thể chia sẻ bài viết: ${e.toString()}');
      return false;
    }
  }

  // Stories Operations
  @action
  Future<void> loadStories() async {
    try {
      setLoading(true);
      clearError();

      // TODO: Implement actual API call
      // final response = await apiService.getStories();

      // Mock implementation
      await Future.delayed(Duration(milliseconds: 800));
      stories.clear();
      stories.addAll([
        {
          'id': 1,
          'userId': 1,
          'userName': 'Bạn',
          'userAvatar': 'https://i.pinimg.com/736x/3f/18/28/3f1828dd47ac78756c5957fcb57c3849.jpg',
          'storyImage': null,
          'isAddStory': true,
        },
        {
          'id': 2,
          'userId': 2,
          'userName': 'Nguyễn A',
          'userAvatar': 'https://i.pinimg.com/736x/4b/59/84/4b5984d18e93691f3ba7d894aefec9af.jpg',
          'storyImage': 'https://i.pinimg.com/736x/cb/4e/64/cb4e645d958ad62a7a2aed5209d56487.jpg',
          'isAddStory': false,
          'createdAt': DateTime.now().subtract(Duration(hours: 1)),
        },
      ]);
    } catch (e) {
      setError('Không thể tải stories: ${e.toString()}');
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<bool> addStory(String imagePath) async {
    try {
      setLoading(true);
      clearError();

      // TODO: Implement actual API call
      // await apiService.addStory(imagePath);

      // Mock implementation
      await Future.delayed(Duration(seconds: 2));
      return true;
    } catch (e) {
      setError('Không thể thêm story: ${e.toString()}');
      return false;
    } finally {
      setLoading(false);
    }
  }

  // Computed values
  @computed
  int get postsCount => posts.length;

  @computed
  int get storiesCount => stories.length;

  @computed
  bool get hasError => errorMessage != null;

  @computed
  List<Map<String, dynamic>> get likedPosts => 
    posts.where((post) => post['isLiked'] == true).toList();

  // Initialize data
  @action
  Future<void> initialize() async {
    await Future.wait([
      loadPosts(refresh: true),
      loadStories(),
    ]);
  }

  // Load more posts (pagination)
  @action
  Future<void> loadMorePosts() async {
    if (!hasMorePosts || isLoading) return;
    await loadPosts();
  }

  // Refresh all data
  @action
  Future<void> refresh() async {
    await initialize();
  }
}
