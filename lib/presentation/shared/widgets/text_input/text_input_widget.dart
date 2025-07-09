import 'package:flutter/material.dart';
import 'package:vdiary_internship/presentation/themes/theme/app-color/app_color.dart';
import '../../../../core/constants/fontsize/font_size_app.dart';

class MyTextInputWidget extends StatefulWidget {
  const MyTextInputWidget({super.key, required this.controller, required this.icon, required this.hintText});

  final TextEditingController controller;
  final IconData icon;
  final String hintText;

  @override
  State<MyTextInputWidget> createState() => _MyTextInputWidgetState();
}

class _MyTextInputWidgetState extends State<MyTextInputWidget> {

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _formKey,
      controller: widget.controller,
      style: TextStyle(
        fontSize: FontSizeApp.fontSizeSmall,
        fontWeight: FontWeight.w400,
        color: Colors.black
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, size: 18,),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: FontSizeApp.fontSizeInsideButton,
          fontWeight: FontWeight.w300,
          color: AppColor.MediumGrey
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(18),
        ),
        filled: true,
        fillColor: AppColor.LightGrey,

        // Trường hợp bị lỗi
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 1,
            style: BorderStyle.solid
          )
        )
      ),
    );
  }
}