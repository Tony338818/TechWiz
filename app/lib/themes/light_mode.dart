// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(
    background: Color(0xFFF5F9FD), // Light background (light sky blue)
    primary: Color(0xFF1D1D1D), // Main text color (dark gray)
    secondary: Color(0xFFFFFFFF), // Card and category background (white)
    surface: Color(0xFFE1E8F0), // Surface for cards and containers (light blue-gray)
    onPrimary: Color(0xFF007CC7), // Active button/category color (bright blue)
    onSecondary: Color(0xFFBCCCE0), // Inactive buttons or categories (light gray-blue)
    error: Color(0xFFEF476F), // Error state (bright red)
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFFFFFFF), // Light background for AppBar
    iconTheme: IconThemeData(color: Color(0xFF1D1D1D)), // Dark icons (to contrast the light background)
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF1D1D1D)), // Main text (dark gray)
    bodyMedium: TextStyle(color: Color(0xFF6B7A8F)), // Subtle secondary text (gray-blue)
    headlineSmall: TextStyle(color: Color(0xFF1D1D1D), fontWeight: FontWeight.bold), // Titles (dark gray, bold)
    titleMedium: TextStyle(color: Color(0xFF007CC7)), // Bright category titles (bright blue)
  ),
  iconTheme: IconThemeData(color: Color(0xFF007CC7)), // Icons (bright blue)
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFF007CC7), // Buttons (bright blue)
  ),
);
