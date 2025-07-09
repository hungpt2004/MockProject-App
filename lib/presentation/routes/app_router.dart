import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vdiary_internship/core/constants/routes/route_name.dart';
import 'package:vdiary_internship/presentation/pages/auth/screens/signin_screen.dart';
import 'package:vdiary_internship/presentation/pages/auth/screens/signup_screen.dart';
import 'package:vdiary_internship/presentation/pages/home/screens/home_screen.dart';
import 'package:vdiary_internship/presentation/pages/dashboard/screens/my_dashboard_screen.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: AppRouteName.signInScreen,
    redirect: _redirect,
    routes: [
      // Auth Routes
      GoRoute(
        path: AppRouteName.signInScreen,
        name: 'signin',
        pageBuilder:
            (context, state) => _buildPageWithTransition(
              context,
              state,
              const SignInScreen(),
              SlideTransitionType.slideLeft,
            ),
      ),

      // SignUp routes
      GoRoute(
        path: AppRouteName.signUpScreen,
        name: 'signup',
        pageBuilder:
            (context, state) => _buildPageWithTransition(
              context,
              state,
              const SignUpScreen(),
              SlideTransitionType.slideRight,
            ),
      ),

      // Home Routes
      GoRoute(
        path: AppRouteName.homeScreen,
        name: 'home',
        pageBuilder:
            (context, state) => _buildPageWithTransition(
              context,
              state,
              const HomeScreen(),
              SlideTransitionType.fade,
            ),
      ),

      // Dashboard Routes
      GoRoute(
        path: AppRouteName.dashboardScreen,
        name: 'dashboard',
        pageBuilder:
            (context, state) => _buildPageWithTransition(
              context,
              state,
              const MyDashboardScreen(),
              SlideTransitionType.slideLeft,
            ),
      ),
    ],
    errorPageBuilder:
        (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Scaffold(
            body: Center(
              child: Text('Page not found: ${state.matchedLocation}'),
            ),
          ),
        ),
  );

  // Kiểm trả xem trong local-storage có không ? Trả về trang home hoặc auth
  static Future<String?> _redirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    final isAuthenticated = token != null && token.isNotEmpty;

    final isLoginPage = state.matchedLocation == AppRouteName.signInScreen;
    final isHomePage = state.matchedLocation == AppRouteName.homeScreen;

    // Debug print để kiểm tra
    print('🔍 Route Debug: matchedLocation=${state.matchedLocation}');
    print('🔍 Route Debug: isAuthenticated=$isAuthenticated');
    print('🔍 Route Debug: isLoginPage=$isLoginPage, isHomePage=$isHomePage');

    // Nếu đã đăng nhập và đang ở trang auth/login, chuyển về home
    if (isAuthenticated && isLoginPage) {
      print('🔄 Redirecting to home (authenticated user on login page)');
      return AppRouteName.homeScreen;
    }

    // Nếu chưa đăng nhập và đang ở trang home, chuyển về login
    if (!isAuthenticated && isHomePage) {
      print('🔄 Redirecting to login (unauthenticated user on home page)');
      return AppRouteName.signInScreen;
    }

    print('🔄 No redirect needed');
    return null; // Không redirect
  }

  // Hiệu ứng điều hướng
  static Page<void> _buildPageWithTransition(
    BuildContext context,
    GoRouterState state,
    Widget child,
    SlideTransitionType transitionType,
  ) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionType: transitionType,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}

// Custom transition page
class CustomTransitionPage<T> extends Page<T> {
  final Widget child;
  final SlideTransitionType transitionType;
  final Duration transitionDuration;

  const CustomTransitionPage({
    required this.child,
    required this.transitionType,
    this.transitionDuration = const Duration(milliseconds: 300),
    super.key,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return PageRouteBuilder<T>(
      settings: this,
      pageBuilder: (context, animation, _) => child,
      transitionDuration: transitionDuration,
      reverseTransitionDuration: transitionDuration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return _buildTransition(
          animation,
          secondaryAnimation,
          child,
          transitionType,
        );
      },
    );
  }

  static Widget _buildTransition(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    SlideTransitionType transitionType,
  ) {
    switch (transitionType) {
      case SlideTransitionType.slideRight:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );

      case SlideTransitionType.slideUp:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );

      case SlideTransitionType.slideDown:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );

      case SlideTransitionType.slideLeft:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );

      case SlideTransitionType.fade:
        return FadeTransition(opacity: animation, child: child);

      case SlideTransitionType.scale:
        return ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );

      case SlideTransitionType.rotation:
        return RotationTransition(
          turns: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
    }
  }
}

enum SlideTransitionType {
  slideRight,
  slideLeft,
  slideUp,
  slideDown,
  fade,
  scale,
  rotation,
}
