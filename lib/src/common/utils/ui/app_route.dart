import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luminously/src/common/utils/ui/build_context_x.dart';

class AppRoute {
  AppRoute._();

  static Route pageRoute<T>({
    required BuildContext context,
    required Widget widget,
  }) {
    return context.theme.platform == TargetPlatform.iOS
        ? CupertinoPageRoute<T>(builder: (BuildContext context) => widget)
        : MaterialPageRoute<T>(builder: (BuildContext context) => widget);
  }

  static Route dialogRoute<T>({
    required BuildContext context,
    required Widget widget,
  }) {
    return context.theme.platform == TargetPlatform.iOS
        ? CupertinoDialogRoute<T>(
            context: context,
            builder: (BuildContext context) => widget,
          )
        : DialogRoute<T>(
            context: context,
            builder: (BuildContext context) => widget,
          );
  }
}
