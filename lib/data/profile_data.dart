import 'package:shared_preferences/shared_preferences.dart';

class ProfileData {
  final SharedPreferences _pref;

  ProfileData(this._pref);

  Future<bool> saveName(String name) async {
    return _pref.setString('name', name);
  }

  Future<String?> fetchName() async {
    return _pref.getString('name');
  }

  Future<bool> removeName() async {
    return _pref.remove('name');
  }
}
