import 'package:flutter/material.dart';

void showLongSnackBar(
  BuildContext context,
  String message, {
  SnackBarAction? snackBarAction,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      action: snackBarAction,
      duration: const Duration(seconds: 4),
    ),
  );
}

void showShortSnackBar(
  BuildContext context,
  String message, {
  SnackBarAction? snackBarAction,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      action: snackBarAction,
      duration: const Duration(seconds: 2),
    ),
  );
}
