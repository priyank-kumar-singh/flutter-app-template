part of 'theme.dart';

class LightTheme extends MyTheme {
  @override
  Color get primaryColor => const Color(0xFF0B4AAA);

  @override
  Color get secondaryColor => const Color(0xFFF0EFEF);

  @override
  TextTheme get textTheme => ThemeData.light().textTheme.apply(
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  @override
  TextTheme get primaryTextTheme => textTheme;

  @override
  ThemeData get themeData => ThemeData.light().copyWith(
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

    bottomNavigationBarTheme: bottomNavigationBarTheme.copyWith(
      selectedItemColor: Colors.blue.shade700,
      unselectedItemColor: Colors.grey.shade600,
    ),

    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      // primary: const Color(0xFF0B4AAA),
      // secondary: const Color.fromARGB(255, 95, 131, 184),
    ),

    dialogTheme: dialogTheme,

    errorColor: errorColor,

    dividerTheme: dividerTheme.copyWith(
      color: Colors.grey.shade600,
    ),

    inputDecorationTheme: inputDecorationTheme.copyWith(
      fillColor: const Color(0xFFEEEEEE)
    ),

    snackBarTheme: snackBarTheme,
  );
}
