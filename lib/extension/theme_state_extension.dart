import 'package:flutter/material.dart';

extension ThemeState on BuildContext {
  bool get isLightThem {
    return Theme.of(this).brightness == Brightness.light;
  }
}