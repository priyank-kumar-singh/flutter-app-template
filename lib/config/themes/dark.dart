part of 'theme.dart';

class DarkTheme extends MyTheme {
  @override
  Color? get primaryColor => null;

  @override
  Color? get secondaryColor => null;

  @override
  TextTheme get textTheme => ThemeData.dark().textTheme.apply(
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  @override
  TextTheme get primaryTextTheme => textTheme;

  @override
  ThemeData get themeData => ThemeData.dark().copyWith(
    textTheme: textTheme,
    primaryTextTheme: primaryTextTheme,

    appBarTheme: AppBarTheme(
      titleTextStyle: titleTextStyle.copyWith(
        color: Colors.white,
      ),
      toolbarTextStyle: toolbarTextStyle.copyWith(
        color: Colors.white,
      ),
    ),

    bottomNavigationBarTheme: bottomNavigationBarTheme,

    errorColor: errorColor,

    dialogTheme: dialogTheme,

    dividerTheme: dividerTheme,

    inputDecorationTheme: inputDecorationTheme,

    snackBarTheme: snackBarTheme,
  );
}
