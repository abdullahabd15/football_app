import 'package:football_app/constant/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtil {
  static final _prefs = SharedPreferences.getInstance();

  static void setLightTheme(bool isLightTheme) async {
    var prefs = await _prefs;
    prefs.setBool(Constants.themeData, isLightTheme);
  }

  static Future<bool> isLightTheme() async {
    var prefs = await _prefs;
    return prefs.getBool(Constants.themeData);
  }
}