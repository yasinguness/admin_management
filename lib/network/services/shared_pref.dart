import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferencesManager? _instance;
  static SharedPreferences? _prefs;

  SharedPreferencesManager._();

  static Future<SharedPreferencesManager> getInstance() async {
    if (_instance == null) {
      _instance = SharedPreferencesManager._();
      await _instance!._initialize();
    }
    return _instance!;
  }

  Future<void> _initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Example methods for getting and setting values
  Future<void> setString(String key, String value) async {
    await _prefs!.setString(key, value);
  }

  String getString(String key) {
    return (_prefs!.getString(key)!);
  }

  // Add more methods as needed...

}
