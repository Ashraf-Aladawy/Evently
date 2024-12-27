import 'dart:ui';

import 'package:evently_app/theme/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkTheme extends BaseTheme {
  @override
  Color get backGroundColor => Color(0xff101127);

  @override
  Color get primaryColor => Color(0xff5669FF);

  @override
  Color get textColor => Colors.white;

  @override
  Color get pointColor => Color(0xffF4EBDC);

  @override
  ThemeData get themeData => ThemeData(
      scaffoldBackgroundColor: backGroundColor,
      cardColor: primaryColor,
      dividerColor: Color(0xffF4EBDC),
      appBarTheme: AppBarTheme(
        backgroundColor: backGroundColor,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: backGroundColor,
          size: 16,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: backGroundColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedIconTheme: IconThemeData(
            color: Colors.white,
          ),
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          unselectedLabelStyle: TextStyle()),
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
          bodySmall: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          labelSmall: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor,
          )));
}
