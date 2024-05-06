import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static final SharedPrefManager _instance = SharedPrefManager._internal();

  factory SharedPrefManager() => _instance;

  SharedPrefManager._internal();

  static Future<SharedPreferences> _getInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    final prefs = await _getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await _getInstance();
    return prefs.getString(key);
  }
  Future<void> setObject(String key, Object value) async {
    final prefs = await _getInstance();
    await prefs.setString(key, jsonEncode(value));
  }

  Future<T?> getObject<T>(String key) async {
    final prefs = await _getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString == null) return null;

    // Direct deserialization based on provided type
    try {
      return jsonDecode(jsonString) as T;
    } catch (e) {
      // Handle potential type mismatches or deserialization errors
      print('Error deserializing object: $e');
      return null;
    }
  }

// Similar methods for other data types (setInt, getInt, setBool, getBool)
}
