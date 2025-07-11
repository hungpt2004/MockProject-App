// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FriendStore on _FriendStore, Store {
  Computed<List<Map<String, dynamic>>>? _$filteredFriendsComputed;

  @override
  List<Map<String, dynamic>> get filteredFriends =>
      (_$filteredFriendsComputed ??= Computed<List<Map<String, dynamic>>>(
            () => super.filteredFriends,
            name: '_FriendStore.filteredFriends',
          ))
          .value;
  Computed<List<Map<String, dynamic>>>? _$filteredSuggestionsComputed;

  @override
  List<Map<String, dynamic>> get filteredSuggestions =>
      (_$filteredSuggestionsComputed ??= Computed<List<Map<String, dynamic>>>(
            () => super.filteredSuggestions,
            name: '_FriendStore.filteredSuggestions',
          ))
          .value;
  Computed<int>? _$friendsCountComputed;

  @override
  int get friendsCount =>
      (_$friendsCountComputed ??= Computed<int>(
            () => super.friendsCount,
            name: '_FriendStore.friendsCount',
          ))
          .value;
  Computed<int>? _$pendingRequestsCountComputed;

  @override
  int get pendingRequestsCount =>
      (_$pendingRequestsCountComputed ??= Computed<int>(
            () => super.pendingRequestsCount,
            name: '_FriendStore.pendingRequestsCount',
          ))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(
            () => super.hasError,
            name: '_FriendStore.hasError',
          ))
          .value;

  late final _$isLoadingAtom = Atom(
    name: '_FriendStore.isLoading',
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
    name: '_FriendStore.errorMessage',
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

  late final _$friendsAtom = Atom(
    name: '_FriendStore.friends',
    context: context,
  );

  @override
  ObservableList<Map<String, dynamic>> get friends {
    _$friendsAtom.reportRead();
    return super.friends;
  }

  @override
  set friends(ObservableList<Map<String, dynamic>> value) {
    _$friendsAtom.reportWrite(value, super.friends, () {
      super.friends = value;
    });
  }

  late final _$friendRequestsAtom = Atom(
    name: '_FriendStore.friendRequests',
    context: context,
  );

  @override
  ObservableList<Map<String, dynamic>> get friendRequests {
    _$friendRequestsAtom.reportRead();
    return super.friendRequests;
  }

  @override
  set friendRequests(ObservableList<Map<String, dynamic>> value) {
    _$friendRequestsAtom.reportWrite(value, super.friendRequests, () {
      super.friendRequests = value;
    });
  }

  late final _$sentRequestsAtom = Atom(
    name: '_FriendStore.sentRequests',
    context: context,
  );

  @override
  ObservableList<Map<String, dynamic>> get sentRequests {
    _$sentRequestsAtom.reportRead();
    return super.sentRequests;
  }

  @override
  set sentRequests(ObservableList<Map<String, dynamic>> value) {
    _$sentRequestsAtom.reportWrite(value, super.sentRequests, () {
      super.sentRequests = value;
    });
  }

  late final _$suggestionsAtom = Atom(
    name: '_FriendStore.suggestions',
    context: context,
  );

  @override
  ObservableList<Map<String, dynamic>> get suggestions {
    _$suggestionsAtom.reportRead();
    return super.suggestions;
  }

  @override
  set suggestions(ObservableList<Map<String, dynamic>> value) {
    _$suggestionsAtom.reportWrite(value, super.suggestions, () {
      super.suggestions = value;
    });
  }

  late final _$searchQueryAtom = Atom(
    name: '_FriendStore.searchQuery',
    context: context,
  );

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$loadFriendsAsyncAction = AsyncAction(
    '_FriendStore.loadFriends',
    context: context,
  );

  @override
  Future<void> loadFriends() {
    return _$loadFriendsAsyncAction.run(() => super.loadFriends());
  }

  late final _$removeFriendAsyncAction = AsyncAction(
    '_FriendStore.removeFriend',
    context: context,
  );

  @override
  Future<bool> removeFriend(int friendId) {
    return _$removeFriendAsyncAction.run(() => super.removeFriend(friendId));
  }

  late final _$loadFriendRequestsAsyncAction = AsyncAction(
    '_FriendStore.loadFriendRequests',
    context: context,
  );

  @override
  Future<void> loadFriendRequests() {
    return _$loadFriendRequestsAsyncAction.run(
      () => super.loadFriendRequests(),
    );
  }

  late final _$acceptFriendRequestAsyncAction = AsyncAction(
    '_FriendStore.acceptFriendRequest',
    context: context,
  );

  @override
  Future<bool> acceptFriendRequest(int requestId) {
    return _$acceptFriendRequestAsyncAction.run(
      () => super.acceptFriendRequest(requestId),
    );
  }

  late final _$rejectFriendRequestAsyncAction = AsyncAction(
    '_FriendStore.rejectFriendRequest',
    context: context,
  );

  @override
  Future<bool> rejectFriendRequest(int requestId) {
    return _$rejectFriendRequestAsyncAction.run(
      () => super.rejectFriendRequest(requestId),
    );
  }

  late final _$sendFriendRequestAsyncAction = AsyncAction(
    '_FriendStore.sendFriendRequest',
    context: context,
  );

  @override
  Future<bool> sendFriendRequest(int userId) {
    return _$sendFriendRequestAsyncAction.run(
      () => super.sendFriendRequest(userId),
    );
  }

  late final _$loadFriendSuggestionsAsyncAction = AsyncAction(
    '_FriendStore.loadFriendSuggestions',
    context: context,
  );

  @override
  Future<void> loadFriendSuggestions() {
    return _$loadFriendSuggestionsAsyncAction.run(
      () => super.loadFriendSuggestions(),
    );
  }

  late final _$searchUsersAsyncAction = AsyncAction(
    '_FriendStore.searchUsers',
    context: context,
  );

  @override
  Future<void> searchUsers(String query) {
    return _$searchUsersAsyncAction.run(() => super.searchUsers(query));
  }

  late final _$initializeAsyncAction = AsyncAction(
    '_FriendStore.initialize',
    context: context,
  );

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  late final _$_FriendStoreActionController = ActionController(
    name: '_FriendStore',
    context: context,
  );

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_FriendStoreActionController.startAction(
      name: '_FriendStore.setLoading',
    );
    try {
      return super.setLoading(value);
    } finally {
      _$_FriendStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String? error) {
    final _$actionInfo = _$_FriendStoreActionController.startAction(
      name: '_FriendStore.setError',
    );
    try {
      return super.setError(error);
    } finally {
      _$_FriendStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearError() {
    final _$actionInfo = _$_FriendStoreActionController.startAction(
      name: '_FriendStore.clearError',
    );
    try {
      return super.clearError();
    } finally {
      _$_FriendStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchQuery(String query) {
    final _$actionInfo = _$_FriendStoreActionController.startAction(
      name: '_FriendStore.setSearchQuery',
    );
    try {
      return super.setSearchQuery(query);
    } finally {
      _$_FriendStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
friends: ${friends},
friendRequests: ${friendRequests},
sentRequests: ${sentRequests},
suggestions: ${suggestions},
searchQuery: ${searchQuery},
filteredFriends: ${filteredFriends},
filteredSuggestions: ${filteredSuggestions},
friendsCount: ${friendsCount},
pendingRequestsCount: ${pendingRequestsCount},
hasError: ${hasError}
    ''';
  }
}
