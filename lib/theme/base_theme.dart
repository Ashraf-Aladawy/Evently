import 'dart:ui';

import 'package:flutter/material.dart';

abstract class BaseTheme{
  Color get backGroundColor;
  Color get primaryColor;
  Color get textColor;
  ThemeData get themeData;
}