import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vdiary_internship/core/constants/fontsize/font_size_app.dart';
import 'package:vdiary_internship/presentation/themes/theme/app-color/app_color.dart';
import 'package:vdiary_internship/presentation/themes/theme/app_theme.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_space_size.dart';

class ToastAppWidget {
  static FToast? _fToast;

  static void _initToast(BuildContext context) {
    try {
      _fToast = FToast();
      _fToast?.init(context);
    } catch (e) {
      print('Error initializing toast: $e');
    }
  }

  static void showSuccessToast(
    BuildContext context,
    String message, {
    Duration? duration,
    VoidCallback? onUndo,
  }) {
    try {
      _initToast(context);
      
      if (_fToast != null) {
        _fToast!.showToast(
          child: _buildToastContent(
            message: message,
            icon: FluentIcons.checkmark_circle_square_16_regular,
            backgroundColor: AppColor.BackgroundColor,
            iconColor: AppColor.SuccessGreen,
            onUndo: onUndo,
            context: context, // ✅ Pass context
          ),
          gravity: ToastGravity.TOP,
          toastDuration: duration ?? const Duration(milliseconds: 2000),
        );
      }
    } catch (e) {
      debugPrint('Error showing success toast: $e');
    }
  }

  static void showErrorToast(
    BuildContext context,
    String message, {
    Duration? duration,
    VoidCallback? onUndo,
  }) {
    try {
      _initToast(context);
      
      if (_fToast != null) {
        _fToast!.showToast(
          child: _buildToastContent(
            message: message,
            icon: Icons.error_rounded,
            backgroundColor: AppColor.BackgroundColor,
            iconColor: AppColor.ErrorRed,
            onUndo: onUndo,
            context: context, // ✅ Pass context
          ),
          gravity: ToastGravity.TOP,
          toastDuration: duration ?? const Duration(milliseconds: 3500),
        );
      }
    } catch (e) {
      debugPrint('Error showing error toast: $e');
    }
  }

  static Widget _buildToastContent({
    required String message,
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
    VoidCallback? onUndo,
    BuildContext? context, 
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          Icon(icon, color: iconColor, size: IconSizeApp.iconSizeMedium),
          AppSpaceSize.spaceWidthApp(8),
          
          // Message
          Flexible(
            child: Text(
              message,
              style: context?.textTheme.bodyMedium ?? const TextStyle(
                fontSize: FontSizeApp.fontSizeSubMedium,
                color: AppColor.DefaultColor,
              ), 
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          
          // Button tắt thanh toast
          if (onUndo != null) ...[
            AppSpaceSize.spaceWidthApp(12),
            InkWell(
              onTap: () {
                try {
                  _fToast?.removeCustomToast();
                  onUndo();
                } catch (e) {
                  debugPrint('Error in onUndo: $e');
                }
              },
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'UNDO',
                  style: context?.textTheme.bodyMedium ?? const TextStyle(
                    fontSize: FontSizeApp.fontSizeSmall,
                    color: AppColor.DefaultColor,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  static void hideToast() {
    try {
      _fToast?.removeCustomToast();
    } catch (e) {
      print('❌ Error hiding toast: $e');
    }
  }
}