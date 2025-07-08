import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:vdiary_internship/presentation/themes/theme/app-color/app_color.dart';

import '../../../../core/constants/fontsize/font_size_app.dart';

class MyEmailFormFieldWidget extends StatelessWidget {
  const MyEmailFormFieldWidget({
    super.key, 
    required this.controller, 
    this.formKey,
    required this.func
  });

  final TextEditingController controller;
  final GlobalKey? formKey; 
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formKey,
      controller: controller,
      style: _buildTextStyle(AppColor.DefaultColor),
      clipBehavior: Clip.antiAlias,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress, 
      validator: _validateEmail, 
      decoration: _buildInputDecoration(),
    );
  }

  InputDecoration _buildInputDecoration() {
    const borderRadius = BorderRadius.all(Radius.circular(10));
    
    return InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: borderRadius,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), 
      filled: true,
      fillColor: AppColor.BackgroundColor,
      hintText: 'Nhập email', 
      hintStyle: _buildTextStyle(AppColor.DefaultColor),
      labelText: 'Email',
      labelStyle: _buildTextStyle(AppColor.LightBlue),
      prefixIcon: Icon(FluentIcons.mail_16_regular, color: AppColor.LightBlue,),
      floatingLabelBehavior: FloatingLabelBehavior.auto, 
      enabledBorder: _buildBorder(AppColor.LightGrey),
      focusedBorder: _buildBorder(AppColor.LightBlue),
      errorBorder: _buildBorder(AppColor.ErrorRed),
      focusedErrorBorder: _buildBorder(AppColor.ErrorRed),
    );
  }

  TextStyle _buildTextStyle(Color color) {
    return TextStyle(
      fontSize: FontSizeApp.fontSizeSubMedium,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: color,
        strokeAlign: BorderSide.strokeAlignCenter,
        width: 1,
        style: BorderStyle.solid
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập email';
    }
    
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Email không hợp lệ';
    }
    
    return null;
  }
}