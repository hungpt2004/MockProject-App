// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  Computed<int>? _$postsCountComputed;

  @override
  int get postsCount =>
      (_$postsCountComputed ??= Computed<int>(
            () => super.postsCount,
            name: '_HomeController.postsCount',
          ))
          .value;
  Computed<int>? _$storiesCountComputed;

  @override
  int get storiesCount =>
      (_$storiesCountComputed ??= Computed<int>(
            () => super.storiesCount,
            name: '_HomeController.storiesCount',
          ))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(
            () => super.hasError,
            name: '_HomeController.hasError',
          ))
          .value;
  Computed<List<Map<String, dynamic>>>? _$likedPostsComputed;

  @override
  List<Map<String, dynamic>> get likedPosts =>
      (_$likedPostsComputed ??= Computed<List<Map<String, dynamic>>>(
            () => super.likedPosts,
            name: '_HomeController.likedPosts',
          ))
          .value;

  late final _$isLoadingAtom = Atom(
    name: '_HomeController.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_HomeController.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$postsAtom = Atom(
    name: '_HomeController.posts',
    context: context,
  );

  @override
  ObservableList<Map<String, dynamic>> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(ObservableList<Map<String, dynamic>> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$storiesAtom = Atom(
    name: '_HomeController.stories',
    context: context,
  );

  @override
  ObservableList<Map<String, dynamic>> get stories {
    _$storiesAtom.reportRead();
    return super.stories;
  }

  @override
  set stories(ObservableList<Map<String, dynamic>> value) {
    _$storiesAtom.reportWrite(value, super.stories, () {
      super.stories = value;
    });
  }

  late final _$isRefreshingAtom = Atom(
    name: '_HomeController.isRefreshing',
    context: context,
  );

  @override
  bool get isRefreshing {
    _$isRefreshingAtom.reportRead();
    return super.isRefreshing;
  }

  @override
  set isRefreshing(bool value) {
    _$isRefreshingAtom.reportWrite(value, super.isRefreshing, () {
      super.isRefreshing = value;
    });
  }

  late final _$hasMorePostsAtom = Atom(
    name: '_HomeController.hasMorePosts',
    context: context,
  );

  @override
  bool get hasMorePosts {
    _$hasMorePostsAtom.reportRead();
    return super.hasMorePosts;
  }

  @override
  set hasMorePosts(bool value) {
    _$hasMorePostsAtom.reportWrite(value, super.hasMorePosts, () {
      super.hasMorePosts = value;
    });
  }

  late final _$currentPageAtom = Atom(
    name: '_HomeController.currentPage',
    context: context,
  );

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$loadPostsAsyncAction = AsyncAction(
    '_HomeController.loadPosts',
    context: context,
  );

  @override
  Future<void> loadPosts({bool refresh = false}) {
    return _$loadPostsAsyncAction.run(() => super.loadPosts(refresh: refresh));
  }

  late final _$createPostAsyncAction = AsyncAction(
    '_HomeController.createPost',
    context: context,
  );

  @override
  Future<bool> createPost(String content, {String? imagePath}) {
    return _$createPostAsyncAction.run(
      () => super.createPost(content, imagePath: imagePath),
    );
  }

  late final _$updatePostAsyncAction = AsyncAction(
    '_HomeController.updatePost',
    context: context,
  );

  @override
  Future<bool> updatePost(int postId, String newContent) {
    return _$updatePostAsyncAction.run(
      () => super.updatePost(postId, newContent),
    );
  }

  late final _$deletePostAsyncAction = AsyncAction(
    '_HomeController.deletePost',
    context: context,
  );

  @override
  Future<bool> deletePost(int postId) {
    return _$deletePostAsyncAction.run(() => super.deletePost(postId));
  }

  late final _$toggleLikeAsyncAction = AsyncAction(
    '_HomeController.toggleLike',
    context: context,
  );

  @override
  Future<bool> toggleLike(int postId) {
    return _$toggleLikeAsyncAction.run(() => super.toggleLike(postId));
  }

  late final _$sharePostAsyncAction = AsyncAction(
    '_HomeController.sharePost',
    context: context,
  );

  @override
  Future<bool> sharePost(int postId) {
    return _$sharePostAsyncAction.run(() => super.sharePost(postId));
  }

  late final _$loadStoriesAsyncAction = AsyncAction(
    '_HomeController.loadStories',
    context: context,
  );

  @override
  Future<void> loadStories() {
    return _$loadStoriesAsyncAction.run(() => super.loadStories());
  }

  late final _$addStoryAsyncAction = AsyncAction(
    '_HomeController.addStory',
    context: context,
  );

  @override
  Future<bool> addStory(String imagePath) {
    return _$addStoryAsyncAction.run(() => super.addStory(imagePath));
  }

  late final _$initializeAsyncAction = AsyncAction(
    '_HomeController.initialize',
    context: context,
  );

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  late final _$loadMorePostsAsyncAction = AsyncAction(
    '_HomeController.loadMorePosts',
    context: context,
  );

  @override
  Future<void> loadMorePosts() {
    return _$loadMorePostsAsyncAction.run(() => super.loadMorePosts());
  }

  late final _$refreshAsyncAction = AsyncAction(
    '_HomeController.refresh',
    context: context,
  );

  @override
  Future<void> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  late final _$_HomeControllerActionController = ActionController(
    name: '_HomeController',
    context: context,
  );

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
      name: '_HomeController.setLoading',
    );
    try {
      return super.setLoading(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRefreshing(bool value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
      name: '_HomeController.setRefreshing',
    );
    try {
      return super.setRefreshing(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String? error) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
      name: '_HomeController.setError',
    );
    try {
      return super.setError(error);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearError() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
      name: '_HomeController.clearError',
    );
    try {
      return super.clearError();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
posts: ${posts},
stories: ${stories},
isRefreshing: ${isRefreshing},
hasMorePosts: ${hasMorePosts},
currentPage: ${currentPage},
postsCount: ${postsCount},
storiesCount: ${storiesCount},
hasError: ${hasError},
likedPosts: ${likedPosts}
    ''';
  }
}
