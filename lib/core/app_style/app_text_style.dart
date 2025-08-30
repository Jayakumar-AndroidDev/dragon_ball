import 'package:dragon_ball_app/core/app_color/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {

  static const String fontFamilyTxt = "mozila";


  static  TextStyle titleMediumTextStyle = TextStyle(
    fontFamily: fontFamilyTxt,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );

  static  TextStyle titleLargeTextStyle = TextStyle(
    fontFamily: fontFamilyTxt,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
  );

  static  TextStyle bodyTextStyle = TextStyle(
    fontFamily: fontFamilyTxt,
    color: AppColors.whiteColor,
  );

   static  TextStyle darkTitleMediumTextStyle = TextStyle(
    fontFamily: fontFamilyTxt,
    fontWeight: FontWeight.w400,
    color: AppColors.darkTextColor,
  );

  static  TextStyle darkTargeTextStyle = TextStyle(
    fontFamily: fontFamilyTxt,
    fontWeight: FontWeight.w700,
    color: AppColors.darkTextColor,
  );

  static  TextStyle darkbodyTextStyle = TextStyle(
    fontFamily: fontFamilyTxt,
    color: AppColors.darkTextColor,
  );
}
