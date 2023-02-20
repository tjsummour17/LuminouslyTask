import 'package:flutter/material.dart';
import 'package:luminously/src/common/services/local_database.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode get themeMode => LocaleDatabase.getTheme();

  set themeMode(ThemeMode value) {
    LocaleDatabase.saveTheme(value);
    notifyListeners();
  }
}
