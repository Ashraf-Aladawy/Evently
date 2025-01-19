import 'dart:ui';

import 'package:evently_app/theme/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme extends BaseTheme {
  @override
  Color get backGroundColor => Color(0xffF2FEFF);

  @override
  Color get primaryColor => Color(0xff5669FF);

  @override
  Color get textColor => Color(0xff1C1C1C);

  @override
  ThemeData get themeData => ThemeData(
      scaffoldBackgroundColor: backGroundColor,
      primaryColor: primaryColor,
      cardColor: Color(0xff7B7B7B),
      dividerColor: Color(0xff1c1c1c),
      appBarTheme: AppBarTheme(
        backgroundColor: backGroundColor,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Color(0xff000000),
          size: 24,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)))),
      textTheme: TextTheme(
          titleMedium: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
          titleSmall: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          bodySmall: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          labelSmall: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xff7B7B7B),
          )));
}
