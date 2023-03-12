import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();
  static final LocalStorage _instance = LocalStorage._();
  static LocalStorage get instance => _instance;

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String? getString(String key) {
    final value = _prefs.getString(key);
    return value;
  }

  Future<void> delete(String key) => _prefs.remove(key);
}
