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

    static Future<void> setIsLightTheme(bool isFirstTime) async {
    await _prefs?.setBool("isLightTheme", isFirstTime);
  }

  
  static bool getIsLightTheme() {
    return _prefs?.getBool("isLightTheme") ?? true;
  }
}
