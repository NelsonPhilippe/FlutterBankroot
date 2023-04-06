import 'package:shared_preferences/shared_preferences.dart';

class Storage {

  static String? getString(String key) {

    String? value;

    _preferences().then((prefs) => {
      value = prefs.getString(key)
    });

    return value;
  }

  static void setString(String key, String value) {
    _preferences().then((prefs) => {
      prefs.setString(key, value)
    });
  }

  static void deleteString(String key) {
    _preferences().then((value) => {
      value.remove(key)
    });
  }

  static Future<SharedPreferences> _preferences()  {
    return SharedPreferences.getInstance();
  }

}