import 'package:shared_preferences/shared_preferences.dart';

class Token {
  // set token
  static Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  // get the token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  // remove token
  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  Future<void> clearInstance() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
