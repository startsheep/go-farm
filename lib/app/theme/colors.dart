// make class for theme
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // make class for theme data
  static Color primary = Color.fromARGB(255, 75, 255, 117);
  static Color secondary = Color.fromARGB(228, 0, 222, 100);
  static Color tertiary = Color.fromARGB(255, 0, 222, 141);
  static Color quaternary = Color.fromARGB(255, 0, 222, 141);
  static Color dIconColor = Color.fromARGB(255, 178, 178, 178);
  static Color dTextColor = Color.fromARGB(255, 0, 0, 0);
  static Color accent = Color.fromARGB(255, 191, 191, 191);
  static Color errorContainer = Color.fromARGB(255, 255, 104, 104);
  static Color defaultBackground = Color.fromARGB(255, 249, 249, 249);
  static ThemeData themeData = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: defaultBackground,
    // fontFamily: GoogleFonts.popp().fontFamily,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primary,
        secondary: secondary,
        errorContainer: errorContainer,
        error: errorContainer,
        onError: errorContainer),
    // text theme from google fonts
    textTheme: GoogleFonts.poppinsTextTheme(
        // Theme.of(Get.context).textTheme,
        ),
  );
}
