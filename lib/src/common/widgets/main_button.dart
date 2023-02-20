import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luminously/src/common/utils/ui/build_context_x.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.textStyle,
    this.isText = false,
    this.color,
    this.icon,
    super.key,
  });

  factory AppButton.icon({
    required String label,
    required Widget icon,
    required VoidCallback? onPressed,
    Color textColor = Colors.white,
    Color? color,
    TextStyle? textStyle,
  }) =>
      AppButton(
        label: label,
        onPressed: onPressed,
        color: color,
        icon: icon,
        textStyle: textStyle,
      );

  factory AppButton.secondary({
    required String label,
    required VoidCallback? onPressed,
    Color color = const Color(0xffe3effb),
    Widget? icon,
    TextStyle? textStyle,
  }) =>
      AppButton(
        label: label,
        onPressed: onPressed,
        icon: icon,
        color: color,
        textStyle: textStyle,
        isText: false,
      );

  factory AppButton.text({
    required String label,
    required VoidCallback? onPressed,
    Color? color,
    Widget? icon,
    TextStyle? textStyle,
  }) =>
      AppButton(
        label: label,
        onPressed: onPressed,
        isText: true,
        color: color,
        icon: icon,
        textStyle: textStyle,
      );

  final String label;
  final VoidCallback? onPressed;
  final Color? color;
  final Widget? icon;
  final TextStyle? textStyle;
  final bool isText;

  @override
  Widget build(BuildContext context) {
    Widget? icon = this.icon;
    final textWidget = Text(
      label,
      style: textStyle ??
          context.textTheme.labelLarge?.copyWith(
            color:
                isText ? (color ?? context.colorScheme.primary) : Colors.white,
          ),
    );
    final Widget text = icon == null
        ? textWidget
        : Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              icon,
              const SizedBox(width: 10, height: 10),
              textWidget,
            ],
          );
    if (Platform.isIOS) {
      return CupertinoButton(
        padding: EdgeInsets.symmetric(
          vertical: isText ? 0 : 8,
          horizontal: isText ? 0 : 15,
        ),
        minSize: isText ? 22 : 44,
        color: (isText ? Colors.transparent : color) ??
            context.colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
        child: text,
        onPressed: onPressed,
      );
    } else {
      if (isText) {
        return TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: const Size(20, 22),
          ),
          onPressed: onPressed,
          child: text,
        );
      } else {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 15,
            ),
            backgroundColor: color ?? context.colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onPressed,
          child: text,
        );
      }
    }
  }
}
