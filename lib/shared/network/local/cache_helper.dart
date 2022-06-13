import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _shPre;

  static init() async {
    _shPre = await SharedPreferences.getInstance();
  }

  static Future<bool> saveThemeMode({
    required isDarkValue,
  }) async {
    return await _shPre!.setBool('isDark', isDarkValue);
  }

  static bool getThemeMode() {
    bool isDarkTheme = _shPre!.getBool('isDark') ?? false;
    return isDarkTheme;
  }
}
