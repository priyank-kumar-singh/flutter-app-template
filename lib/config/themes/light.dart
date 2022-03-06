part of 'controller.dart';

final _lightTheme = ThemeData.light().copyWith(
  textTheme: ThemeData.light().textTheme.apply(
    fontFamily: GoogleFonts.poppins().fontFamily,
  ).copyWith(),
  primaryTextTheme: ThemeData.light().textTheme.apply(
    fontFamily: GoogleFonts.poppins().fontFamily,
  ).copyWith(),

  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.w600,
    ),
    toolbarTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 14.0,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: Colors.blue.shade700,
    unselectedItemColor: Colors.grey.shade600,
    selectedLabelStyle: GoogleFonts.poppins(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: GoogleFonts.poppins(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
    ),
  ),

  colorScheme: ColorScheme.fromSeed(
    seedColor: ThemeConstants.lightThemePrimaryColor,
    // primary: const Color(0xFF0B4AAA),
    // secondary: const Color.fromARGB(255, 95, 131, 184),
  ),

  dividerTheme: DividerThemeData(
    color: Colors.grey.shade600,
    indent: 16.0,
    endIndent: 16.0,
  ),

  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    filled: true,
    fillColor: Color(0xFFEEEEEE),
  ),

  errorColor: ThemeConstants.errorColor,
  dialogTheme: ThemeConstants.dialogTheme,
  snackBarTheme: ThemeConstants.snackBarTheme,
);
