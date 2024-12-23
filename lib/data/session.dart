import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  Session(this._pref);
  final SharedPreferences _pref;

  Future<bool> saveUser(Map<String, dynamic> user) async {
    return _pref.setString('user', jsonEncode(user));
  }

  Future<Map<String, dynamic>?> fetchUser() async {
    final userString = _pref.getString('user');
    if (userString == null) return null;
    return jsonDecode(userString) as Map<String, dynamic>;
  }

  Future<bool> removeUser() async => _pref.remove('user');

  Future<bool> saveToken(Map<String, dynamic> token) async {
    return _pref.setString('token', jsonEncode(token));
  }

  Future<Map<String, dynamic>?> fetchToken() async {
    final tokenString = _pref.getString('token');
    if (tokenString == null) return null;
    return jsonDecode(tokenString) as Map<String, dynamic>;
  }

  Future<bool> removeToken() async => _pref.remove('token');
}
