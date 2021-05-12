import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {

  static const String IS_LOGIN = "is_login";
  static const String KEY_IDS = "key_ids";



  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences _prefsInstance;



  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }


  // get and ser string
  static String getString(String key, [String defValue]) {
    return _prefsInstance.getString(key) ??  defValue ?? "";
  }


  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs?.setString(key, value) ?? Future.value(false);
  }



  // get and set bool
  static bool getBool(String key, [bool defValue]) {
    return _prefsInstance.getBool(key) ?? defValue ?? false;
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs?.setBool(key, value) ?? Future.value(false);
  }



  // set and get int
  static int getInt(String key, [int defValue]) {
    return _prefsInstance.getInt(key) ?? defValue ?? 0;
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs?.setInt(key, value) ?? Future.value(false);
  }



  // remove key
  static Future<bool> remove(String key) async {
    var prefs = await _instance;
    return prefs?.remove(key);
  }




  // save object
  static Future<bool> saveObject(String key, dynamic object) async {
    var prefs = await _instance;
    String user = jsonEncode(object);
    return await prefs.setString(key, user);
  }


  static Future<dynamic> getObject(String key) async {
    var _prefs = await _instance;
    var dataString = _prefs.getString(key);
    return await dataString == null ? null : jsonDecode(dataString);
  }


  static dynamic getObjects(String key) async {
    var _prefsInstance = await _instance;
    var dataString =  _prefsInstance.getString(key);
    return await dataString == null ? null :  jsonDecode(dataString);
  }



}
