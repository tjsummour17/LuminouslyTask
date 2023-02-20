import 'package:flutter/material.dart';
import 'package:luminously/src/common/lang/lang.dart';
import 'package:luminously/src/common/services/local_database.dart';

class LocaleProvider extends ChangeNotifier {
  Locale locale = const Locale('en');
  bool isConnectedToInternet = true;

  void setLocale(Locale locale) {
    if (!Lang.all.contains(locale)) return;
    this.locale = locale;
    LocaleDatabase.saveLanguage(locale.languageCode);
    notifyListeners();
  }
}
