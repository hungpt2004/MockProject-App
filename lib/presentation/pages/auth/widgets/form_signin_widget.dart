import 'package:flutter/material.dart';
import 'package:vdiary_internship/presentation/shared/widgets/text_input/email_input_widget.dart';
import 'package:vdiary_internship/presentation/shared/widgets/text_input/password_input_widget.dart';
import 'package:vdiary_internship/presentation/themes/theme/app_theme.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_responsive_size.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_space_size.dart';

class FormSignInWidget extends StatefulWidget {
  const FormSignInWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey, // ✅ Chỉ cần 1 form key
    required this.login,
    required this.register,
    this.isLoading = false, 
    this.isRememberMe = false, 
    this.onRememberMeChanged, 
    this.errorMessage, 
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey; // ✅ Một form key duy nhất
  final VoidCallback login;
  final VoidCallback register;
  final bool isLoading; 
  final bool isRememberMe; 
  final ValueChanged<bool?>? onRememberMeChanged; 
  final String? errorMessage;

  @override
  State<FormSignInWidget> createState() => _FormSignInWidgetState();
}

class _FormSignInWidgetState extends State<FormSignInWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveSizeApp(context).screenWidth,
      height: ResponsiveSizeApp(context).screenHeight * 0.55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      child: Form(
        key: widget.formKey, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            // Email Input
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: MyEmailFormFieldWidget(
                controller: widget.emailController,
                func: () {},
              ),
            ),

            AppSpaceSize.spaceHeightApp(15),

            // Password Input
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: MyPasswordFormFieldWidget(
                controller: widget.passwordController,
                func: () {},
              ),
            ),

            // Remember Me + Forgot Password
            _buildRememberMeForgotPassword(context),

            AppSpaceSize.spaceHeightApp(20),

            // Login Button
            _buildLoginButton(context),

            AppSpaceSize.spaceHeightApp(20),

            // Register Button
            _buildRegisterButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRememberMeForgotPassword(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                side: BorderSide(
                  color: context.colorScheme.onSecondary
                ),
                value: widget.isRememberMe, 
                onChanged: widget.onRememberMeChanged, 
              ),
              Text(
                "Lưu đăng nhập",
                style: context.textTheme.bodyMedium,
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Quên mật khẩu",
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        onPressed: widget.isLoading ? null : () {
          // ✅ Validate form duy nhất
          if (widget.formKey.currentState?.validate() ?? false) {
            widget.login();
          }
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: widget.isLoading 
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                "Đăng nhập",
                style: context.textTheme.labelLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  // 
  Widget _buildRegisterButton(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: TextButton(
        onPressed: widget.isLoading ? null : widget.register,
        child: Text(
          "Chưa có tài khoản? Đăng ký ngay",
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
