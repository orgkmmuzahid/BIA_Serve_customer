import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,

    primary: Color(0xFF0A6F77), // 🟦 Primary: Buttons, active tabs
    onPrimary: Color(0xFFFFFFFF), // 🔳 Text/icons on primary

    secondary: Color(0xFF03DAC6), // 🟢 Secondary: Chips, switches, highlights
    onSecondary: Colors.black, // 🔳 Text/icons on secondary color

    error: Color(0xFFCF6679), // 🔴 Error background (dialogs, forms)
    onError: Colors.black, // 🔳 Text/icons on error background

    surface: Color(0xFF1F1F1F), // 🟤 Surface: Cards, sheets, dialogs
    onSurface: Colors.white, // ⚪ Text/icons on surface

    surfaceContainerLowest: Color(
      0xFF121212,
    ), // 🪵 Deep backgrounds: Scaffold, drawers
    surfaceContainerLow: Color(0xFF1A1A1A), // 🪵 Lower elevation surfaces
    surfaceContainer: Color(0xFF1F1F1F), // 🪵 Mid elevation surfaces
    surfaceContainerHigh: Color(
      0xFF232323,
    ), // 🪵 Higher elevation (e.g. dialogs)
    surfaceContainerHighest: Color(0xFF262626), // 🪵 Top-level surfaces

    onSurfaceVariant: Colors.white70, // ⚪ Subtle text/icons on surfaces

    inverseSurface: Color(
      0xFFE6E1E5,
    ), // 🔄 Used in pull-to-refresh, bottom sheets
    onInverseSurface: Colors.black, // 🔳 Text/icons on inverseSurface

    inversePrimary: Color(0xFF6650A4), // 🔄 Highlight when using inverse color
    outline: Color(0xFF8A8A8A), // 📏 Borders, dividers, outlines
    outlineVariant: Color(0xFF424242), // 📏 Lower emphasis outlines

    shadow: Colors.black, // 🧱 Shadows (e.g., elevation effects)
    scrim: Colors.black54, // 🚪 Overlays, modals, drawers
    surfaceTint: Color(0xFFBB86FC), // 🎨 Elevation tint (Material 3 effect)
  ),

  scaffoldBackgroundColor:
      Colors.white10, // 📱 Main background (scaffolds, screens)

  appBarTheme: AppBarTheme(
    surfaceTintColor: Colors.white10, // 🧼 Removes elevation overlay tint
    backgroundColor: Colors.white10, // 🎛 App bar surface
    foregroundColor: Colors.white10, // 📝 App bar text/icon color
    elevation: 0,
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ), // 📝 Primary body text, font size 16
    bodyMedium: GoogleFonts.dmSans(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ), // 📝 Secondary body text font size 14
    bodySmall: TextStyle(color: Colors.white), //font size 12

    titleLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ), // 🏷 Headings / Titles

    titleSmall: GoogleFonts.dmSans(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ),
  ),

  cardColor: Color(0xFF1E1E1E), // 🃏 Cards and containers

  dividerColor: Colors.grey, // ➖ Dividers between elements

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFF1E1E1E), // 🧾 Input field background
    border: OutlineInputBorder(), // 🔲 Border style
    labelStyle: TextStyle(color: Colors.white70), // 🏷 Label text color
  ),
);
