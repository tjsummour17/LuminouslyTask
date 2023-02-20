import 'package:flutter/material.dart';

class Lang {
  static final all = [const Locale('en')];

  static String getLangName(String code) {
    switch (code) {
      case 'en':
      default:
        return 'English';
    }
  }
}
