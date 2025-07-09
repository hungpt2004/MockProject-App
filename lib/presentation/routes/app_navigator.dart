// Use to create more direction function
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:vdiary_internship/core/constants/routes/route_name.dart';

class AppNavigator {
  
  static void toLogin(BuildContext context) {
    context.go(AppRouteName.signInScreen);
  }

  static void toRegister(BuildContext context) {
    context.go(AppRouteName.signUpScreen);
  }

  static void toHome(BuildContext context) {
    context.go(AppRouteName.homeScreen);
  }

  static void toDashboard(BuildContext context) {
    context.go(AppRouteName.dashboardScreen);
  }

  static void pop(BuildContext context) {
    context.pop();
  }

  static bool canPop(BuildContext context) {
    return context.canPop();
  }

  // Hàm điều hướng custom cho phép truyền tham số
  // TODO: goNamed -> thay thế màn hình hiện tại
  static void goNamed(BuildContext context, String name, {Map<String, String>? pathParameters, Map<String, dynamic>? queryParameters}) {
    context.goNamed(name, pathParameters: pathParameters ?? {}, queryParameters: queryParameters ?? {});
  }

  // TODO: pushNamed -> thêm một màn hình mới vào stack
  static void pushNamed(BuildContext context, String name, {Map<String, String>? pathParameters, Map<String, dynamic>? queryParameters}) {
    context.pushNamed(name, pathParameters: pathParameters ?? {}, queryParameters: queryParameters ?? {});
  }

  // TODO: deprecated
  
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