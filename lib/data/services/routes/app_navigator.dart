// Use to create more direction function
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:vdiary_internship/core/constants/routes/route_name.dart';

class AppNavigator {
  
  /// Context-based navigation methods (RECOMMENDED)
  /// Pass context from widgets to these methods
  
  static void toLogin(BuildContext context) {
    context.go(AppRouteName.signInScreen);
  }

  static void toHome(BuildContext context) {
    context.go(AppRouteName.homeScreen);
  }

  static void toDashboard(BuildContext context) {
    context.go(AppRouteName.dashboardScreen);
  }

  // Pop current route
  static void pop(BuildContext context) {
    context.pop();
  }

  // Check if can pop
  static bool canPop(BuildContext context) {
    return context.canPop();
  }

  // Navigate by name with parameters
  static void goNamed(BuildContext context, String name, {Map<String, String>? pathParameters, Map<String, dynamic>? queryParameters}) {
    context.goNamed(name, pathParameters: pathParameters ?? {}, queryParameters: queryParameters ?? {});
  }

  static void pushNamed(BuildContext context, String name, {Map<String, String>? pathParameters, Map<String, dynamic>? queryParameters}) {
    context.pushNamed(name, pathParameters: pathParameters ?? {}, queryParameters: queryParameters ?? {});
  }

  /// Legacy methods (DEPRECATED - avoid using these)
  /// Only use if you absolutely cannot pass context
  
  @deprecated
  static void toLoginLegacy() {
    final context = _getContext();
    if (context != null) {
      context.go(AppRouteName.signInScreen);
    }
  }

  @deprecated
  static void toHomeLegacy() {
    final context = _getContext();
    if (context != null) {
      context.go(AppRouteName.homeScreen);
    }
  }

  // Legacy context getter - only for emergency use
  static BuildContext? _getContext() {
    return WidgetsBinding.instance.focusManager.primaryFocus?.context;
  }
}