import 'package:dragon_ball_app/core/app_color/app_colors.dart';
import 'package:dragon_ball_app/core/app_style/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.bgColor,
    brightness: Brightness.light,
    textTheme: TextTheme(
      titleMedium: AppTextStyle.titleMediumTextStyle,
      titleLarge: AppTextStyle.titleLargeTextStyle,
      bodySmall: AppTextStyle.bodyTextStyle,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBgColor,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      titleMedium: AppTextStyle.darkTitleMediumTextStyle,
      titleLarge: AppTextStyle.darkTargeTextStyle,
      bodySmall: AppTextStyle.darkbodyTextStyle,
    ),
  );
}
