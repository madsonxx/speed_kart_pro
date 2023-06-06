import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.amberAccent,
      foregroundColor: Colors.greenAccent,
      hoverColor: Colors.redAccent,
      splashColor: Colors.tealAccent),
  appBarTheme: AppBarTheme(backgroundColor: Colors.black),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.grey[900]!,
    secondary: Colors.grey[800]!,
  ),
);
