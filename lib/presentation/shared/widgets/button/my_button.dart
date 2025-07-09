import 'package:flutter/material.dart';
import 'package:vdiary_internship/core/constants/fontsize/font_size_app.dart';
import 'package:vdiary_internship/presentation/themes/theme/app-color/app_color.dart';

class MyAppButtonWidget extends StatelessWidget {
  const MyAppButtonWidget({super.key, required this.func, required this.text});

  final VoidCallback? func;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: func,
      style: _buttonStyleCustom(),
      child: _textChildren(),
    );
  }

  // Children của button
  Text _textChildren() {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: FontSizeApp.fontSizeInsideButton,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }

  // Button Style Custom
  ButtonStyle _buttonStyleCustom() {
    return ButtonStyle(
      elevation: WidgetStatePropertyAll(5),
      backgroundColor: WidgetStatePropertyAll(AppColor.LightBlue),
      visualDensity: VisualDensity(horizontal: 2, vertical: 0),
      shadowColor: WidgetStatePropertyAll(Colors.white.withValues(alpha: 1)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: FontSizeApp.fontSizeInsideButton,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}

