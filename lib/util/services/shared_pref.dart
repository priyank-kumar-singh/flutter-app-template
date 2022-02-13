import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static const field1 = 'name';
  static const field2 = 'type';

  static SharedPreferences? _prefs;

  static Future<SharedPrefService> getInstance() async {
    _prefs = await SharedPreferences.getInstance();
    return SharedPrefService._();
  }

  SharedPrefService._();

  Future<void> saveKeyValue<T>(String key, T value) async {
    if (T.runtimeType == bool) {
      await _prefs?.setBool(key, value as bool);
    } else if (T.runtimeType == double) {
      await _prefs?.setDouble(key, value as double);
    } else if (T.runtimeType == int) {
      await _prefs?.setInt(key, value as int);
    } else if (T.runtimeType == String) {
      await _prefs?.setString(key, value as String);
    } else if (T.runtimeType == List<String>) {
      await _prefs?.setStringList(key, value as List<String>);
    } else {
      throw 'Please provide a valid type of generic';
    }
  }

  T? get<T>(String key) {
    if (T.runtimeType == bool) {
      return _prefs?.getBool(key) as T;
    } else if (T.runtimeType == double) {
      return _prefs?.getDouble(key) as T;
    } else if (T.runtimeType == int) {
      return _prefs?.getInt(key) as T;
    } else if (T.runtimeType == String) {
      return _prefs?.getString(key) as T;
    } else if (T.runtimeType == List<String>) {
      return _prefs?.getStringList(key) as T;
    }
    return null;
  }
}

late SharedPrefService sharedPrefs;
