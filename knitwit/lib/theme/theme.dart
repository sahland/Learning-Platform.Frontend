import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _primaryColor = Color(0xFF1C202A); 

  static const Color _secondaryColor = Color(0xFFF32363F);

  //static const Color _purpleColor = Color(0xFFFBE1257);

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    disabledColor: _secondaryColor,
    primaryColor: _primaryColor,
    scaffoldBackgroundColor: _primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: _primaryColor,
      foregroundColor: _primaryColor,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: _primaryColor,
      selectionColor: _primaryColor,
      selectionHandleColor: _primaryColor
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(

      )
    )
  );
}