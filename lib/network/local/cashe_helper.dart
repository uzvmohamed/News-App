import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setBool(key, value) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool getBool(key) {
    return sharedPreferences.getBool(key) ?? false;
  }
}
