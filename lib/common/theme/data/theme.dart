import 'package:flutter/material.dart';

class AppTheme {
  // for light mode
  static final light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.green[300],
    scaffoldBackgroundColor: Colors.grey[100],
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.grey[800],
      ),
      bodyMedium: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Colors.grey[800],
      ),
      bodyLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.grey[800],
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green[300],
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.grey[200],
      ),
      centerTitle: true,
      elevation: 10,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.green[300],
      elevation: 10,
      shape: const CircleBorder(),
    ),
  );
  // for dark mode
  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.green[700],
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.grey[200],
      ),
      bodyMedium: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Colors.grey[200],
      ),
      bodyLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.grey[200],
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green[700],
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.grey[200],
      ),
      centerTitle: true,
      elevation: 10,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.green[700],
      elevation: 10,
      shape: const CircleBorder(),
    ),
  );
}
