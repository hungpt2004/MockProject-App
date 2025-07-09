import 'package:flutter/material.dart';
import 'package:vdiary_internship/presentation/themes/theme/app-color/app_color.dart';
import '../../../core/constants/fontsize/font_size_app.dart';

class AppTheme {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      
      // Color Scheme 
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: AppColor.LightBlue,          
        onPrimary: AppColor.BackgroundColor,
        primaryContainer: AppColor.SuperLightBlue,
        onPrimaryContainer: AppColor.BackgroundColor,
        secondary: AppColor.SuperLightBlue,
        onSecondary: AppColor.DefaultColor,
        secondaryContainer: AppColor.LightGrey,
        onSecondaryContainer: AppColor.DefaultColor,
        tertiary: AppColor.MediumGrey,
        onTertiary: AppColor.BackgroundColor,
        tertiaryContainer: AppColor.SuperLightGrey,
        onTertiaryContainer: AppColor.DefaultColor,
        error: AppColor.ErrorRed,
        onError: AppColor.BackgroundColor,
        errorContainer: AppColor.ErrorRed,
        onErrorContainer: AppColor.ErrorRed,
        surface: AppColor.BackgroundColor,
        onSurface: AppColor.DefaultColor,
        onSurfaceVariant: AppColor.DefaultColor,
        outline: AppColor.MediumGrey,
        outlineVariant: AppColor.LightGrey,
        shadow: AppColor.DefaultColor,
        scrim: AppColor.DefaultColor,
        inverseSurface: AppColor.DefaultColor,
        onInverseSurface: AppColor.BackgroundColor,
        inversePrimary: AppColor.LightBlue,
        surfaceTint: AppColor.LightBlue,
      ),

      // Scaffold Theme
      scaffoldBackgroundColor: AppColor.BackgroundColor,

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.BackgroundColor,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: FontSizeApp.fontSizeMedium,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),

      // Text Theme
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: FontSizeApp.fontSizeTitle,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headlineMedium: TextStyle(
          fontSize: FontSizeApp.fontSubTitle,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        // Body Text
        bodyLarge: TextStyle(
          fontSize: FontSizeApp.fontSizeMedium,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: FontSizeApp.fontSizeSubMedium,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        bodySmall: TextStyle(
          fontSize: FontSizeApp.fontSizeSmall,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        // Labels
        labelLarge: TextStyle(
          fontSize: FontSizeApp.fontSizeSubMedium,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        labelMedium: TextStyle(
          fontSize: FontSizeApp.fontSizeSmall,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        labelSmall: TextStyle(
          fontSize: FontSizeApp.fontSizeInsideButton,
          fontWeight: FontWeight.w400,
          color: AppColor.MediumGrey,
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColor.BackgroundColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.LightBlue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.LightBlue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.LightBlue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),
        hintStyle: TextStyle(
          fontSize: FontSizeApp.fontSizeInsideButton,
          color: AppColor.MediumGrey,
        ),
        labelStyle: TextStyle(
          fontSize: FontSizeApp.fontSizeInsideButton,
          color: AppColor.LightBlue,
        ),
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.LightBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: TextStyle(
            fontSize: FontSizeApp.fontSizeSmall,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColor.LightBlue,
          textStyle: TextStyle(
            fontSize: FontSizeApp.fontSizeSmall,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: AppColor.BackgroundColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // Icon Theme
      iconTheme: IconThemeData(
        color: AppColor.MediumGrey,
        size: IconSizeApp.iconSizeMedium,
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColor.LightBlue;
          }
          return Colors.transparent;
        }),
        checkColor: MaterialStateProperty.all(Colors.white),
        side: BorderSide(color: AppColor.LightBlue),
      ),

      // List Tile Theme
      listTileTheme: ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textColor: Colors.black,
        iconColor: AppColor.MediumGrey,
      ),
    );
  }

  // Dark Theme (tuỳ chọn)
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColor.LightBlue,
        brightness: Brightness.dark,
      ),
    );
  }
}

// Extension để dễ dàng truy cập theme
extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
