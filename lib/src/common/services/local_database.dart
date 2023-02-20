import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocaleDatabase {
  LocaleDatabase._();

  static const _langKey = 'langKey';
  static const _infoKey = 'userInfo';
  static const _theme = 'theme';
  static late Box _appDatabase;

  static Future<void> initializeLocaleDatabase() async {
    try {
      await Hive.initFlutter();
      _appDatabase = await Hive.openBox<String>('AppData');
    } catch (e) {
      log('Database initializeCashDbBox error');
      log(e.toString());
      return;
    }
  }

  static void saveUserInfo({
    required String email,
    required String password,
  }) {
    try {
      Map<String, dynamic> data = <String, dynamic>{
        'email': email,
        'password': password,
      };
      _appDatabase.put(_infoKey, jsonEncode(data));
    } catch (e) {
      log(e.toString());
    }
  }

  static Map<String, dynamic>? getUserInfo() {
    try {
      String? userInfo = _appDatabase.get(_infoKey) as String?;
      if (userInfo != null) {
        return jsonDecode(userInfo) as Map<String, dynamic>?;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static void saveTheme(ThemeMode themeMode) {
    try {
      log(themeMode.toString());
      _appDatabase.put(_theme, themeMode.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  static ThemeMode getTheme() {
    try {
      String? theme = _appDatabase.get(_theme) as String?;
      if (theme == null || theme == 'ThemeMode.system') {
        return ThemeMode.system;
      } else if (theme == 'ThemeMode.light') {
        return ThemeMode.light;
      } else {
        return ThemeMode.dark;
      }
    } catch (e) {
      log(e.toString());
      return ThemeMode.system;
    }
  }

  static void saveLanguage(String lang) {
    try {
      _appDatabase.put(_langKey, lang);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<String> getLanguage() async {
    try {
      String? lang = await _appDatabase.get(_langKey) as String?;
      return lang ?? 'en';
    } catch (e) {
      log(e.toString());
      return 'en';
    }
  }

  static void clearInfoKey() {
    try {
      _appDatabase.delete(_infoKey);
    } catch (e) {
      log(e.toString());
    }
  }
}
