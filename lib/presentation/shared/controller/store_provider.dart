import 'package:flutter/material.dart';
import 'package:vdiary_internship/presentation/pages/auth/controller/auth_controller.dart';
import 'package:vdiary_internship/presentation/pages/dashboard/controller/dashboard_controller.dart';
import 'package:vdiary_internship/presentation/pages/friends/controller/friends_controller.dart';
import 'package:vdiary_internship/presentation/pages/home/controller/home_controller.dart';

/// Global store provider để quản lý tất cả các MobX stores
class StoreProvider extends InheritedWidget {
  final AuthController authController;
  final DashboardController dashboardController;
  final FriendsController friendsController;
  final HomeController homeController;

  const StoreProvider({
    Key? key,
    required this.authController,
    required this.dashboardController,
    required this.friendsController,
    required this.homeController,
    required Widget child,
  }) : super(key: key, child: child);

  static StoreProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StoreProvider>();
  }

  @override
  bool updateShouldNotify(StoreProvider oldWidget) {
    return authController != oldWidget.authController ||
           dashboardController != oldWidget.dashboardController ||
           friendsController != oldWidget.friendsController ||
           homeController != oldWidget.homeController;
  }
}

/// Extension để truy cập stores dễ dàng hơn
extension StoreExtension on BuildContext {
  AuthController get authController {
    final provider = StoreProvider.of(this);
    if (provider == null) {
      throw Exception('StoreProvider not found in widget tree');
    }
    return provider.authController;
  }

  DashboardController get dashboardController {
    final provider = StoreProvider.of(this);
    if (provider == null) {
      throw Exception('StoreProvider not found in widget tree');
    }
    return provider.dashboardController;
  }

  FriendsController get friendsController {
    final provider = StoreProvider.of(this);
    if (provider == null) {
      throw Exception('StoreProvider not found in widget tree');
    }
    return provider.friendsController;
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
  static AuthController? _authController;
  static DashboardController? _dashboardController;
  static FriendsController? _friendsController;
  static HomeController? _homeController;

  /// Singleton instance của AuthController
  static AuthController get authController {
    _authController ??= AuthController();
    return _authController!;
  }

  /// Singleton instance của DashboardController
  static DashboardController get dashboardController {
    _dashboardController ??= DashboardController();
    return _dashboardController!;
  }

  /// Singleton instance của FriendsController
  static FriendsController get friendsController {
    _friendsController ??= FriendsController();
    return _friendsController!;
  }

  /// Singleton instance của HomeController
  static HomeController get homeController {
    _homeController ??= HomeController();
    return _homeController!;
  }

  /// Initialize tất cả stores
  static Future<void> initializeAll() async {
    // Load saved credentials synchronously
    authController.loadSavedCredentials();
    
    // Initialize other stores
    await Future.wait([
      dashboardController.initialize(),
      friendsController.initialize(),
      homeController.initialize(),
    ]);
  }

  /// Dispose tất cả stores (nếu cần)
  static void disposeAll() {
    _authController = null;
    _dashboardController = null;
    _friendsController = null;
    _homeController = null;
  }
}
