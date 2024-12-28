import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: darkColorScheme,
);

final lightColorScheme = ColorScheme(
  primary: Color(0xFF007AFF), // Darker Zoom blue
  secondary: Color(0xFF201E20), // Darker Zoom green
  surface: Color(0xFFFFFFFF), // Light background
  error: Color(0xFFFF3B30), // Error red
  onPrimary: Color(0xFFFFFFFF), // White on primary
  onSecondary: Color(0xFFFFFFFF), // White on secondary
  onSurface: Color(0xFF000000), // Black on background
  onError: Color(0xFFFFFFFF), // White on error
  brightness: Brightness.light, // Light theme
  outline: Color(0xFF545458), // Dark gray
  outlineVariant: Color(0xFF3A3A3C), // Dark gray
);

final darkColorScheme = ColorScheme(
  primary: Color(0xFF0A84FF), // Darker Zoom blue
  secondary: Color(0xFF201E20), // Darker Zoom green
  surface: Color(0xFF1C1C1E), // Dark background
  error: Color(0xFFFF453A), // Error red
  onPrimary: Color(0xFFFFFFFF), // White on primary
  onSecondary: Color(0xFFFFFFFF), // White on secondary
  onSurface: Color(0xFFFFFFFF), // White on background
  onError: Color(0xFF000000), // Black on error
  brightness: Brightness.dark, // Dark theme
  outline: Color(0xFF545458), // Dark gray
  outlineVariant: Color(0xFF3A3A3C), // Dark gray
);
