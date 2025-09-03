import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _prefs;

  
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

 
  static Future<void> setIsFirstUser(bool isFirstTime) async {
    await _prefs?.setBool("isFirstTime", isFirstTime);
  }

  
  static bool getIsFirstUser() {
    return _prefs?.getBool("isFirstTime") ?? true;
  }

    static Future<void> setIsDarkTheme(bool isFirstTime) async {
    await _prefs?.setBool("isDarktTheme", isFirstTime);
  }

  
  static bool getIsDarkTheme() {
    return _prefs?.getBool("isDarktTheme") ?? false;
  }
}
