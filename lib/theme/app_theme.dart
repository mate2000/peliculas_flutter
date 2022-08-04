import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = Colors.green.shade600;
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: primaryColor,
      /////////////////
      appBarTheme: AppBarTheme(color: primaryColor, elevation: 0));
}
