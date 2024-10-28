import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? accesstoken;
  static const String _accessTokenKey = 'access-token';
  static Future<void> saveAccessToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, token);
    accesstoken = token;
  }

  static Future<String?> getAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);
    accesstoken = token;
    return token;
  }

 static bool isLoggedIn() {
    return accesstoken != null;
  }

  static Future<void> cleareUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
