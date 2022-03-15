import 'package:flutter/material.dart';

import 'theme.dart';

class DarkTheme extends MyTheme {
  @override
  Color? get primaryColor => const Color(0xFFA19CEA);

  @override
  Color? get secondaryColor1 => null;

  @override
  TextTheme get textTheme => darkTextTheme;

  @override
  TextStyle get titleTextStyle => super.titleTextStyle.copyWith(
    color: primaryColor,
  );

  @override
  ThemeData get themeData => ThemeData.dark().copyWith(
    appBarTheme: appBarTheme,
    bottomNavigationBarTheme: bottomNavigationBarTheme,
    errorColor: errorColor,
    dialogTheme: dialogTheme,
    dividerTheme: dividerTheme,
    inputDecorationTheme: inputDecorationTheme,
    snackBarTheme: snackBarTheme,
    textTheme: textTheme,
    primaryTextTheme: primaryTextTheme,
  );
}
