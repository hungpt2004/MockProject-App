import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:vdiary_internship/core/constants/gen/image_path.dart';
import 'package:vdiary_internship/presentation/pages/auth/widgets/form_signup_widget.dart';
import 'package:vdiary_internship/presentation/routes/app_navigator.dart';
import 'package:vdiary_internship/presentation/pages/auth/controller/auth_controller.dart';
import 'package:vdiary_internship/presentation/pages/auth/widgets/form_signin_widget.dart';
import 'package:vdiary_internship/presentation/themes/theme/app_theme.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_responsive_size.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_space_size.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthController _authController = AuthController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController address = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _authController.loadSavedCredentials();
    _setupControllers();
  }

  void _setupControllers() {
    emailController.addListener(() {
      _authController.setEmail(emailController.text);
    });
    
    passwordController.addListener(() {
      _authController.setPassword(passwordController.text);
    });

    emailController.text = _authController.email;
    passwordController.text = _authController.password;
  }

  Future<void> handleSignUp() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    
    try {
      // final success = await _authController.register();
      final success = true;

      if (success) {
        // Use context-based navigation

        await Future.delayed(Duration(seconds: 2), () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Đăng ký thành công !')),
          );
        });

        if (mounted) {
          AppNavigator.toLogin(context);
        }
      } else {
        if (_authController.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(_authController.errorMessage ?? 'Đăng nhập thất bại')),
          );
        }
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Có lỗi xảy ra: ${error.toString()}')),
      );
    } 
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: context.colorScheme.onPrimary,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [

            AppSpaceSize.spaceHeightApp(100),

            SizedBox(
              width: ResponsiveSizeApp(context).widthPercent(200),
              height: ResponsiveSizeApp(context).heightPercent(200),
              child: Center(
                child: Lottie.asset(ImagePath.LottieRegisterForm),
              ),
            ),
            
            AppSpaceSize.spaceHeightApp(20),

            // Observer để reactive với MobX state
            Observer(
              builder: (_) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: FormSignUpWidget(
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                  addressController: addressController,
                  authController: _authController,
                  register: handleSignUp,
                  formKey: formKey,
                  isLoading: _authController.isLoading, 
                  errorMessage: _authController.errorMessage, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
