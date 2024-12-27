import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late final SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveOnBording() async {
    bool result = await prefs.setBool("onBoarding", true);
    return result;
  }

  static bool? getOnBoarding() {
    return prefs.getBool("onBoarding");
  }
}
