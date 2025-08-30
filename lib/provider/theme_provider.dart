import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends Notifier<bool> {
  @override
  build() {
    return true;
  }

  void changeTheme() => state = !state;
}

final themeProvider = NotifierProvider<ThemeProvider, bool>(
  () => ThemeProvider(),
);
