import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  // Define colors
  static const Color primaryColor = Color(0xFF50E8D1); // Accent teal
  static const Color darkBgColor = Color(0xFF0B0B08); // Deep black
  static const Color secondaryColor = Color(0xFF494F35); // Subtle surface
  static const Color neutralAccent = Color(0xFF978F77); // Warm accent

  // Common text styles using Google Fonts
  static TextTheme _lightTextTheme = TextTheme(
    headlineSmall: GoogleFonts.montserrat(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: darkBgColor,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 16,
      color: Colors.black87,
    ),
    labelLarge: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: primaryColor,
    ),
  );

  static TextTheme _darkTextTheme = TextTheme(
    headlineSmall: GoogleFonts.montserrat(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 16,
      color: Colors.white70,
    ),
    labelLarge: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: primaryColor,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: darkBgColor,
      elevation: 0.5,
      titleTextStyle: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: darkBgColor,
      ),
      iconTheme: const IconThemeData(color: darkBgColor),
    ),
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: Colors.white,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: Colors.black12,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.black,
      elevation: 3,
    ),
    textTheme: _lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.black,
        textStyle: GoogleFonts.roboto(fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: darkBgColor,
    appBarTheme: AppBarTheme(
      backgroundColor: darkBgColor,
      foregroundColor: Colors.white,
      elevation: 0.5,
      titleTextStyle: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      iconTheme: const IconThemeData(color: primaryColor),
    ),
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: neutralAccent,
      surface: secondaryColor,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
    ),
    cardTheme: CardThemeData(
      color: secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      shadowColor: Colors.black45,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.black,
      elevation: 3,
    ),
    textTheme: _darkTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.black,
        textStyle: GoogleFonts.roboto(fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
