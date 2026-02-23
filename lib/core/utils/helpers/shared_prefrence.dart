import 'package:shared_preferences/shared_preferences.dart';

class TSharedPreferences {
  static SharedPreferences? _prefs;

  // أول خطوة: لازم تنادي الـ init دي في الـ main.dart
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // حفظ بيانات (Generic)
  static Future<bool> saveData(String key, dynamic value) async {
    if (value is String) return await _prefs!.setString(key, value);
    if (value is int) return await _prefs!.setInt(key, value);
    if (value is bool) return await _prefs!.setBool(key, value);
    if (value is double) return await _prefs!.setDouble(key, value);
    return false;
  }

  // قراءة بيانات
  static dynamic getData(String key) {
    return _prefs?.get(key);
  }

  // مسح مفتاح معين
  static Future<bool> removeData(String key) async {
    return await _prefs!.remove(key);
  }

  // مسح كل البيانات (لو عمل Logout مثلاً)
  static Future<bool> clearAll() async {
    return await _prefs!.clear();
  }
}