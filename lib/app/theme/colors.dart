// make class for theme
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // make class for theme data
  static Color primary = Color.fromARGB(255, 75, 255, 117);
  static Color secondary = Color.fromARGB(228, 0, 222, 100);
  static Color success = Color.fromARGB(255, 119, 255, 119);
  static Color warning = Color.fromARGB(255, 255, 255, 117);
  static Color danger = Color.fromARGB(255, 255, 107, 107);
  static Color dIconColor = Color.fromARGB(255, 178, 178, 178);
  static Color gray = Color.fromARGB(255, 127, 127, 127);
  static Color dTextColor = Color.fromARGB(255, 0, 0, 0);
  static Color accent = Color.fromARGB(255, 191, 191, 191);
  static Color errorContainer = Color.fromARGB(255, 255, 104, 104);
  static Color defaultBackground = Color.fromARGB(255, 249, 249, 249);
  static BoxShadow dShadow = BoxShadow(
    color: Color.fromARGB(255, 237, 237, 237).withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 2,
    offset: Offset(2, 2),
  );
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
