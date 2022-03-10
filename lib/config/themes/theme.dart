import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'light.dart';
part 'dark.dart';

abstract class MyTheme {
  // theme data of current theme.
  // needs to be overriden by the sub-class.
  ThemeData get themeData;

  Color? get primaryColor;

  Color? get secondaryColor;

  TextTheme get textTheme;

  TextTheme get primaryTextTheme;

  @protected
  TextStyle get titleTextStyle => TextStyle(
    fontSize: 20.0,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontWeight: FontWeight.w600,
  );

  @protected
  TextStyle get toolbarTextStyle => TextStyle(
    fontSize: 14.0,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  @protected
  Color get errorColor => Colors.redAccent;

  // protected global theme constants
  @protected
  BottomNavigationBarThemeData get bottomNavigationBarTheme => BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedLabelStyle: GoogleFonts.poppins(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: GoogleFonts.poppins(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
    ),
  );

  @protected
  DialogTheme get dialogTheme => const DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  );

  @protected
  DividerThemeData get dividerTheme => const DividerThemeData(
    indent: 16.0,
    endIndent: 16.0,
  );

  @protected
  InputDecorationTheme get inputDecorationTheme => const InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    filled: true,
  );

  @protected
  SnackBarThemeData get snackBarTheme => const SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    actionTextColor: Colors.purple,
  );
}
