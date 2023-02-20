import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

extension BuildContextX on BuildContext {
  AppLocalizations get localizations =>
      AppLocalizations.of(this) ?? AppLocalizationsEn();

  String get localeName => AppLocalizations.of(this)?.localeName ?? 'en';

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  Size get screenSize => MediaQuery.of(this).size;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;

  OverlayState get overlay => Overlay.of(this);

  Future<dynamic> push(Widget widget) => Navigator.of(this).push(
        theme.platform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (BuildContext context) => widget)
            : MaterialPageRoute(builder: (BuildContext context) => widget),
      );

  Future<dynamic> pushNamed(String routeName) =>
      Navigator.of(this).pushNamed(routeName);

  Future<dynamic> pushReplacementNamed(String routeName) =>
      Navigator.of(this).pushReplacementNamed(routeName);

  Future<dynamic> openPopUp({
    required Widget popUpWidget,
  }) =>
      Navigator.push(
        this,
        theme.platform == TargetPlatform.iOS
            ? CupertinoDialogRoute(
                context: this,
                builder: (context) => popUpWidget,
              )
            : DialogRoute(
                context: this,
                builder: (context) => popUpWidget,
              ),
      );

  Future<dynamic> openBottomSheet<T>({
    required Widget bottomSheet,
  }) {
    if (theme.platform == TargetPlatform.iOS) {
      return showCupertinoModalPopup<T>(
        context: this,
        builder: (context) => bottomSheet,
      );
    } else {
      return showModalBottomSheet<T>(
        context: this,
        backgroundColor: Colors.transparent,
        elevation: 0,
        builder: (context) => bottomSheet,
      );
    }
  }

  void showSnackBar({required String message}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  void pop([dynamic result]) => Navigator.of(this).pop(result);
}
