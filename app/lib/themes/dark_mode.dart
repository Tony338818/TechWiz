// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Color(0xFF0D1B2A), // Dark navy blue for the background
    primary: Color(0xFFFFFFFF), // Main text color (white)
    secondary: Color(0xFF1F4068), // Card and category background (darker blue)
    surface: Color(0xFF1B263B), // Surface for cards and containers (dark navy)
    onPrimary: Color(0xFF007CC7), // Active button/category color (bright blue)
    onSecondary: Color(0xFF4D648D), // Inactive buttons or categories (muted blue-gray)
    error: Color(0xFFEF476F), // Error state (bright red)
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF0D1B2A), // Match the main dark background
    iconTheme: IconThemeData(color: Color(0xFFFFFFFF)), // White icons
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Color(0xFFFFFFFF)), // Main text (white)
    bodyMedium: TextStyle(color: Color(0xFF6B7A8F)), // Subtle secondary text (light gray-blue)
    headlineSmall: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold), // Titles (white, bold)
    titleMedium: TextStyle(color: Color(0xFF007CC7)), // Bright category titles (bright blue)
  ),
  iconTheme: IconThemeData(color: Color(0xFF007CC7)), // Icons (bright blue)
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFF007CC7), // Buttons (bright blue)
  ),
);
