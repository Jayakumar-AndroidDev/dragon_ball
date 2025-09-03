import 'package:dragon_ball_app/core/local_storage/shared_pref.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends Notifier<bool> {
  @override
  build() {
    return SharedPref.getIsDarkTheme();
  }

  void changeTheme(bool isLightTheme) => state = !state;
}

final themeProvider = NotifierProvider<ThemeProvider, bool>(
  () => ThemeProvider(),
);
