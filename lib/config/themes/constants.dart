import 'package:flutter/material.dart';

abstract class ThemeConstants {
  static const lightThemePrimaryColor = Color(0xFF0B4AAA);
  static const lightThemeSecondaryColor = Color(0xFFF0EFEF);

  static const errorColor = Colors.redAccent;

  static const snackBarTheme = SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    actionTextColor: Colors.purple,
  );

  static const dialogTheme = DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  );
}
