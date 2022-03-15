import 'package:flutter/material.dart';

import 'theme.dart';

class LightTheme extends MyTheme {
  @override
  Color get primaryColor => const Color(0xFF0B4AAA);

  @override
  Color get secondaryColor1 => const Color(0xFFF0EFEF);

  @override
  ColorScheme? get colorScheme => ColorScheme.fromSeed(
    seedColor: primaryColor,
  );

  @override
  TextTheme get textTheme => lightTextTheme;

  @override
  ThemeData get themeData => ThemeData.light().copyWith(
    appBarTheme: appBarTheme,

    bottomNavigationBarTheme: bottomNavigationBarTheme.copyWith(
      selectedItemColor: Colors.blue.shade700,
      unselectedItemColor: Colors.grey.shade600,
    ),

    colorScheme: colorScheme,
    dialogTheme: dialogTheme,
    errorColor: errorColor,

    dividerTheme: dividerTheme.copyWith(
      color: Colors.grey.shade600,
    ),

    inputDecorationTheme: inputDecorationTheme.copyWith(
      fillColor: const Color(0xFFEEEEEE)
    ),

    snackBarTheme: snackBarTheme,
    textTheme: textTheme,
    primaryTextTheme: primaryTextTheme,
  );
}
