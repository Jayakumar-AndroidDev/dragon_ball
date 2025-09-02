import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends Notifier<bool> {
  @override
  build() {
    return true;
  }

  void changeTheme(bool isLightTheme) => state = !state;
}

final themeProvider = NotifierProvider<ThemeProvider, bool>(
  () => ThemeProvider(),
);
