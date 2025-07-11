import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vdiary_internship/core/constants/gen/image_path.dart';
import 'package:vdiary_internship/presentation/routes/app_navigator.dart';
import 'package:vdiary_internship/presentation/pages/auth/controller/auth_controller.dart';
import 'package:vdiary_internship/presentation/pages/auth/widgets/form_signin_widget.dart';
import 'package:vdiary_internship/presentation/themes/theme/app_theme.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_responsive_size.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_space_size.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthController _authController = AuthController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _authController.loadSavedCredentials();
    _setupControllers();
  }

  void _goToRegisterPage(){
    if(mounted){
      AppNavigator.toRegister(context);
    }
  }

  void _setupControllers() {
    _authController.setupTextControllers(null, emailController, passwordController);
  }

  void _handleSignIn() async {
    await _authController.handleSignIn(emailController.text, passwordController.text, formKey, context);
  }

  // Method handle remember me
  void handleRememberMeChanged(bool? value) {
    _authController.authStore.setRememberMe(value ?? false);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colorScheme.onPrimary,
      body: SingleChildScrollView(
        child: Column(
          children: [

            AppSpaceSize.spaceHeightApp(100),

            SizedBox(
              width: ResponsiveSizeApp(context).widthPercent(200),
              height: ResponsiveSizeApp(context).heightPercent(200),
              child: Center(
                child: Image.asset(ImagePath.UserSocialLogin),
              ),
            ),
            
            AppSpaceSize.spaceHeightApp(20),

            // Observer để reactive với MobX state
            Observer(
              builder: (_) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: FormSignInWidget(
                  emailController: emailController,
                  passwordController: passwordController,
                  formKey: formKey,
                  login: _handleSignIn,
                  register: _goToRegisterPage, 
                  isLoading: _authController.authStore.isLoading, 
                  isRememberMe: _authController.authStore.isRememberMe, 
                  onRememberMeChanged: handleRememberMeChanged, 
                  errorMessage: _authController.authStore.errorMessage, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
