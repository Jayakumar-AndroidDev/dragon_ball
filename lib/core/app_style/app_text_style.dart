import 'package:flutter/material.dart';

class AppTextStyle {

  static const String fontFamilyTxt = "mozila";


  static  TextStyle titleMediumTextStyle = TextStyle(
    fontFamily: fontFamilyTxt,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static  TextStyle titleLargeTextStyle = TextStyle(
    fontFamily: fontFamilyTxt,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const TextStyle bodyTextStyle = TextStyle(
    fontFamily: fontFamilyTxt,
    color: Colors.white,
  );
}
