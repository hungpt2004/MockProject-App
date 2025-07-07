// NAVIGATION EXAMPLES - How to use the new context-based navigation system

import 'package:flutter/material.dart';
import 'package:vdiary_internship/data/services/routes/app_navigator.dart';

/// This file shows examples of how to use the new context-based navigation system.
/// 
/// IMPORTANT: Always pass BuildContext to navigation methods!
/// 
/// ✅ CORRECT USAGE:
/// ```dart
/// AppNavigator.toHome(context);
/// ```
/// 
/// ❌ WRONG USAGE (OLD WAY):
/// ```dart
/// AppNavigator.toHome(); // This will cause "context not available" errors
/// ```

class NavigationExamples {
  
  /// Example 1: Navigate from a StatefulWidget
  static void navigateFromStatefulWidget(BuildContext context) {
    AppNavigator.toHome(context);
  }

  /// Example 2: Navigate from a StatelessWidget
  static void navigateFromStatelessWidget(BuildContext context) {
    AppNavigator.toLogin(context);
  }

  /// Example 3: Navigate after async operation (like login)
  static Future<void> navigateAfterAsyncOperation(BuildContext context) async {
    // Perform async operation
    await Future.delayed(Duration(seconds: 1));
    
    // Check if widget is still mounted before navigation
    if (context.mounted) {
      AppNavigator.toHome(context);
    }
  }

  /// Example 4: Navigate from a button onPressed
  static Widget buildNavigationButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        AppNavigator.toHome(context);
      },
      child: Text('Go to Home'),
    );
  }

  /// Example 5: Navigate with parameters
  static void navigateWithParameters(BuildContext context) {
    AppNavigator.goNamed(
      context,
      'home',
      pathParameters: {'id': '123'},
      queryParameters: {'tab': 'profile'},
    );
  }

  /// Example 6: Navigate from a MobX controller
  /// Pass context from the widget to the controller method
  static void navigateFromController(BuildContext context, bool loginSuccess) {
    if (loginSuccess) {
      AppNavigator.toHome(context);
    } else {
      AppNavigator.toLogin(context);
    }
  }

  /// Example 7: Navigate with replacement (go vs push)
  static void navigateWithReplacement(BuildContext context) {
    // Use go() to replace current route
    AppNavigator.toHome(context);
  }

  static void navigateWithPush(BuildContext context) {
    // Use pushNamed() to push new route on stack
    AppNavigator.pushNamed(context, 'home');
  }

  /// Example 8: Check if can pop before navigation
  static void safeNavigation(BuildContext context) {
    if (AppNavigator.canPop(context)) {
      AppNavigator.pop(context);
    } else {
      // Go to a specific route if cannot pop
      AppNavigator.toHome(context);
    }
  }

  /// Example 9: Navigate from a dialog
  static void showDialogWithNavigation(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Navigation Dialog'),
        content: Text('Where would you like to go?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop(); // Close dialog first
              AppNavigator.toHome(context); // Then navigate using original context
            },
            child: Text('Go to Home'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop(); // Close dialog first
              AppNavigator.toLogin(context); // Then navigate using original context
            },
            child: Text('Go to Login'),
          ),
        ],
      ),
    );
  }

  /// Example 10: Navigate from a callback
  static void navigateFromCallback(BuildContext context) {
    // When using callbacks, make sure to pass context
    performAsyncTask(onSuccess: () {
      if (context.mounted) {
        AppNavigator.toHome(context);
      }
    });
  }

  static void performAsyncTask({required VoidCallback onSuccess}) {
    Future.delayed(Duration(seconds: 1), onSuccess);
  }
}

/// Extension methods for easier navigation
extension NavigationExtensions on BuildContext {
  
  /// Quick navigation methods
  void goToHome() => AppNavigator.toHome(this);
  void goToLogin() => AppNavigator.toLogin(this);
  void goToDashboard() => AppNavigator.toDashboard(this);
  
  /// Safe pop with fallback
  void safePopOr(String fallbackRoute) {
    if (AppNavigator.canPop(this)) {
      AppNavigator.pop(this);
    } else {
      AppNavigator.goNamed(this, fallbackRoute);
    }
  }
}

/// Example usage of extensions:
/// ```dart
/// // In your widget:
/// onPressed: () => context.goToHome(),
/// onPressed: () => context.safePopOr('home'),
/// ```
