import 'package:flutter/material.dart';
import 'package:vdiary_internship/presentation/pages/auth/store/auth_store.dart';
import 'package:vdiary_internship/presentation/routes/app_navigator.dart';
import 'package:vdiary_internship/presentation/shared/widgets/toast_message/toast_widget.dart';

class AuthController {
  final AuthStore _authStore = AuthStore();
  AuthStore get authStore => _authStore;

  // Sign In
  Future<void> handleSignIn(
    String email,
    String password,
    GlobalKey<FormState> formKey,
    BuildContext context,
  ) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      final success = await _authStore.login();
      debugPrint('Đăng nhập trạng thái: $success');
      if (success == true) {
        ToastAppWidget.showSuccessToast(
          context,
          'Login successfully',
          onUndo: () {
            AppNavigator.pop(context);
          },
        );
        // Điều hướng qua trang dashboard
        await Future.delayed(Duration(seconds: 2), () {
          AppNavigator.toDashboard(context);
        });
      } else {
        if (_authStore.hasError) {
          ToastAppWidget.showErrorToast(
          context,
          _authStore.errorMessage ?? 'Đăng nhập thất bại',
          onUndo: () {
            AppNavigator.pop(context);
          },
        );
        }
      }
    } catch (error) {
      ToastAppWidget.showErrorToast(
          context,
          _authStore.errorMessage ?? 'Đăng nhập thất bại',
          onUndo: () {
            AppNavigator.pop(context);
          },
        );
    }
  }

  // Sign Up
  Future<void> handleSignUp(
    BuildContext context,
    String name,
    String email,
    String password,
    String confirmPassword,
    GlobalKey<FormState> formKey,
  ) async {
    try {

      final formState = formKey.currentState;
      if (formState == null || !formState.validate()) {
        return;
      }

      final success = await _authStore.register(
        name,
        email,
        password,
        confirmPassword,
      );

      if (success) {
        if (context.mounted) {
          try {

            final message = _authStore.successMessage ?? 'Đăng ký thành công!';
            debugPrint('Success message: $message');

            debugPrint('Showing success toast...');
            ToastAppWidget.showSuccessToast(
              context,
              message,
              onUndo: () {
                debugPrint('Toast onUndo called');
                try {
                  AppNavigator.pop(context);
                } catch (e) {
                  debugPrint('Error in toast onUndo: $e');
                }
              },
            );

            // Xóa success message 
            _authStore.setSuccessMessage('');

            debugPrint('Navigating to login...');
            AppNavigator.toLogin(context);
          } catch (e) {
            debugPrint('Error in success handling: $e');
            debugPrint('Stack trace: ${StackTrace.current}');
          }
        }
      } else {
        if (_authStore.hasError && context.mounted) {
          ToastAppWidget.showErrorToast(
            context,
            _authStore.errorMessage ?? 'Đăng ký thất bại!',
          );
        }
      }
    } catch (error) {
      if (context.mounted) {
        ToastAppWidget.showErrorToast(context, 'Lỗi: ${error.toString()}');
      }
    }
  }

  // Logout
  void handleLogout(BuildContext context) async {
    await _authStore.logout(context);
  }

  // Load provinces
  Future<void> loadVietNamProvinces() async {
    await _authStore.loadVietNamProvinces();
  }

  // Lấy thông tin local storage
  void loadSavedCredentials() {
    _authStore.loadSavedCredentials();
  }

  // Set up controller
  void setupTextControllers(
    TextEditingController? nameController,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    // nameController.addListener(() {
    //   _authStore.setName(nameController.text);
    // });

    emailController.addListener(() {
      _authStore.setEmail(emailController.text);
    });

    passwordController.addListener(() {
      _authStore.setPassword(passwordController.text);
    });

    emailController.text = _authStore.email;
    passwordController.text = _authStore.password;
    // nameController.text = _authStore.name;
  }


}
