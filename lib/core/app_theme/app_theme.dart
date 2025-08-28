import 'package:dragon_ball_app/core/app_style/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      titleMedium: AppTextStyle.titleMediumTextStyle,
      titleLarge: AppTextStyle.titleLargeTextStyle,
      bodySmall: AppTextStyle.bodyTextStyle,
    )
  );
}