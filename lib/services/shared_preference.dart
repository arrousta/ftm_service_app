import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  Future<String> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getString(key)) ?? "";
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  check(String key) async {
    final prefs = await SharedPreferences.getInstance();
    bool hasKey = prefs.containsKey(key);
    return hasKey;
  }


  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}

/*
class SharedPreference {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode((prefs.getString(key)) ?? '');
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  check(String key) async {
    final prefs = await SharedPreferences.getInstance();
    bool hasKey = prefs.containsKey(key);
    return hasKey;
  }


  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}

 */