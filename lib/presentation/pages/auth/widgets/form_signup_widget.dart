import 'package:flutter/material.dart';
import 'package:vdiary_internship/presentation/pages/auth/store/auth_store.dart';
import 'package:vdiary_internship/presentation/pages/auth/widgets/address_select_widget.dart';
import 'package:vdiary_internship/presentation/routes/app_navigator.dart';
import 'package:vdiary_internship/presentation/shared/widgets/text_input/email_input_widget.dart';
import 'package:vdiary_internship/presentation/shared/widgets/text_input/password_input_widget.dart';
import 'package:vdiary_internship/presentation/themes/theme/app_theme.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_responsive_size.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_space_size.dart';

class FormSignUpWidget extends StatefulWidget {
  const FormSignUpWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.register,
    this.isLoading = false,
    this.isRememberMe = false,
    this.onRememberMeChanged,
    this.errorMessage,
    required this.confirmPasswordController,
    required this.addressController,
    required this.authStore,
    required this.nameController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController addressController;
  final TextEditingController nameController;
  final AuthStore authStore;
  final GlobalKey<FormState> formKey;
  final VoidCallback register;
  final bool isLoading;
  final bool isRememberMe;
  final ValueChanged<bool?>? onRememberMeChanged;
  final String? errorMessage;

  @override
  State<FormSignUpWidget> createState() => _FormSignUpWidgetState();
}

class _FormSignUpWidgetState extends State<FormSignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveSizeApp(context).screenWidth,
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
                hintText: 'Enter email',
                labelText: 'Email',
                controller: widget.emailController,
                func: () {},
                isEmail: true,
              ),
            ),

            AppSpaceSize.spaceHeightApp(15),

            // Name Input
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: MyEmailFormFieldWidget(
                hintText: 'Enter name',
                labelText: 'Name',
                controller: widget.nameController,
                func: () {},
                isEmail: false,
              ),
            ),

            AppSpaceSize.spaceHeightApp(15),

            // Address Input
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: AddressSelectFormWidget(
                authStore: widget.authStore,
                controller: widget.addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng chọn thành phố';
                  }
                  return null;
                },
              ),
            ),

            AppSpaceSize.spaceHeightApp(15),

            // Password Input
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: MyPasswordFormFieldWidget(
                labelText: 'Password',
                controller: widget.passwordController,
                func: () {},
              ),
            ),

            AppSpaceSize.spaceHeightApp(10),

            // Confirm Password Input
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: MyPasswordFormFieldWidget(
                labelText: 'Confirm password',
                controller: widget.confirmPasswordController,
                func: () {},
              ),
            ),

            AppSpaceSize.spaceHeightApp(50),

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

  Widget _buildLoginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        onPressed:
            widget.isLoading
                ? null
                : () {
                  if (widget.formKey.currentState?.validate() ?? false) {
                    widget.register();
                  }
                },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child:
            widget.isLoading
                ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
                : Text(
                  "Đăng ký",
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
        onPressed: () {
          if (mounted) {
            AppNavigator.goNamed(context, 'signin');
          }
        },
        child: Text(
          "Đã có tài khoản? Đăng nhập ngay",
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
