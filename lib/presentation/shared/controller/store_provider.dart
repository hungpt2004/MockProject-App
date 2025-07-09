import 'package:flutter/material.dart';
import 'package:vdiary_internship/presentation/pages/auth/store/auth_store.dart';
import 'package:vdiary_internship/presentation/pages/dashboard/controller/dashboard_controller.dart';
import 'package:vdiary_internship/presentation/pages/friends/store/friend_store.dart';
import 'package:vdiary_internship/presentation/pages/home/controller/home_controller.dart';

/// Global store provider để quản lý tất cả các MobX stores
class StoreProvider extends InheritedWidget {
  final AuthStore authStore;
  final DashboardController dashboardController;
  final FriendStore friendStore;
  final HomeController homeController;

  const StoreProvider({
    Key? key,
    required this.authStore,
    required this.dashboardController,
    required this.friendStore,
    required this.homeController,
    required Widget child,
  }) : super(key: key, child: child);

  static StoreProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StoreProvider>();
  }

  @override
  bool updateShouldNotify(StoreProvider oldWidget) {
    return authStore != oldWidget.authStore ||
           dashboardController != oldWidget.dashboardController ||
           friendStore != oldWidget.friendStore ||
           homeController != oldWidget.homeController;
  }
}

/// Extension để truy cập stores dễ dàng hơn
extension StoreExtension on BuildContext {
  AuthStore get authStore {
    final provider = StoreProvider.of(this);
    if (provider == null) {
      throw Exception('StoreProvider not found in widget tree');
    }
    return provider.authStore;
  }

  DashboardController get dashboardController {
    final provider = StoreProvider.of(this);
    if (provider == null) {
      throw Exception('StoreProvider not found in widget tree');
    }
    return provider.dashboardController;
  }

  FriendStore get friendStore {
    final provider = StoreProvider.of(this);
    if (provider == null) {
      throw Exception('StoreProvider not found in widget tree');
    }
    return provider.friendStore;
  }

  HomeController get homeController {
    final provider = StoreProvider.of(this);
    if (provider == null) {
      throw Exception('StoreProvider not found in widget tree');
    }
    return provider.homeController;
  }
}

/// Factory class để tạo và quản lý các stores
class StoreFactory {
  static AuthStore? _authStore;
  static DashboardController? _dashboardController;
  static FriendStore? _friendStore;
  static HomeController? _homeController;

  /// Singleton instance của AuthController
  static AuthStore get authStore {
    _authStore ??= AuthStore();
    return _authStore!;
  }

  /// Singleton instance của DashboardController
  static DashboardController get dashboardController {
    _dashboardController ??= DashboardController();
    return _dashboardController!;
  }

  /// Singleton instance của FriendsController
  static FriendStore get friendStore {
    _friendStore ??= FriendStore();
    return _friendStore!;
  }

  /// Singleton instance của HomeController
  static HomeController get homeController {
    _homeController ??= HomeController();
    return _homeController!;
  }

  /// Initialize tất cả stores
  static Future<void> initializeAll() async {
    // Load saved credentials synchronously
    authStore.loadSavedCredentials();

    // Initialize other stores
    await Future.wait([
      dashboardController.initialize(),
      friendStore.initialize(),
      homeController.initialize(),
    ]);
  }

  /// Dispose tất cả stores (nếu cần)
  static void disposeAll() {
    _authStore = null;
    // Các store khác
    _dashboardController = null;
    _friendStore = null;
    _homeController = null;
  }
}
