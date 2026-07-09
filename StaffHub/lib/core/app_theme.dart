import 'package:flutter/material.dart';
import 'package:staffhub/core/app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.background,
      colorScheme: ColorScheme.light(
        primary: AppColor.primary,
        surface: AppColor.surface,
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColor.orange,
        ),
        titleLarge: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w600,
          color: AppColor.textDark,
        ),
        titleMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColor.orange,
        ),
        displaySmall: TextStyle(),
        bodyMedium: TextStyle(color: AppColor.textDark, fontSize: 15),
        bodySmall: TextStyle(fontSize: 13, color: AppColor.textMuted),
      ),
    );
  }
}
