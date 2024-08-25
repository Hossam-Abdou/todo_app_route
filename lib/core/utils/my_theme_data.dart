import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_route/core/utils/app_colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    // textSelectionTheme: TextSelectionThemeData(
    //   cursorColor: Colors.red,
    //   selectionColor: Colors.green,
    //   selectionHandleColor: Colors.yellow,
    //
    // ),
    useMaterial3: false,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.secondary,

    textTheme: TextTheme(
      // bodyLarge: GoogleFonts.elMessiri(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
      bodyMedium: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700,color: Colors.black),
      // bodySmall:
      // GoogleFonts.elMessiri(fontSize: 20, fontWeight: FontWeight.normal,color: Colors.white),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
      titleTextStyle: GoogleFonts.elMessiri(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.darkPrimary,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          elevation: 0,
          titleTextStyle: GoogleFonts.elMessiri(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
      //
      textTheme: TextTheme(
        // bodyLarge: GoogleFonts.elMessiri(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
        bodyMedium: GoogleFonts.elMessiri(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white),
        // bodySmall:
        // GoogleFonts.elMessiri(fontSize: 20, fontWeight: FontWeight.normal,color: Colors.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColors.darkBottomBar,
      ));
}
