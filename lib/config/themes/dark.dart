part of 'controller.dart';

final _darkTheme = ThemeData.dark().copyWith(
  textTheme: ThemeData.dark().textTheme.apply(
    fontFamily: GoogleFonts.poppins().fontFamily,
  ).copyWith(),
  primaryTextTheme: ThemeData.dark().textTheme.apply(
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
    selectedLabelStyle: GoogleFonts.poppins(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: GoogleFonts.poppins(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
    ),
  ),

  dividerTheme: const DividerThemeData(
    indent: 16.0,
    endIndent: 16.0,
  ),

  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    filled: true,
  ),

  errorColor: ThemeConstants.errorColor,
  dialogTheme: ThemeConstants.dialogTheme,
  snackBarTheme: ThemeConstants.snackBarTheme,
);
