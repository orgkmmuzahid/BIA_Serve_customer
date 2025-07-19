import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,

  colorScheme: const ColorScheme(
    brightness: Brightness.dark,

    primary: Color(0xFF4DB8BF), // 🌊 Slightly brighter teal
    onPrimary: Color(0xFF000000), // ⬛ Dark text on bright buttons

    secondary: Color(0xFF6FBF73), // 🌿 Adjusted green for better visibility
    onSecondary: Color(0xFF000000),

    error: Color(0xFFFF6B6B),
    onError: Color(0xFF000000),

    surface: Color(0xFF1A1A1A),
    onSurface: Color(0xFFEFEFEF),

    surfaceContainerLowest: Color(0xFF121212),
    surfaceContainerLow: Color(0xFF1C1C1C),
    surfaceContainer: Color(0xFF222222),
    surfaceContainerHigh: Color(0xFF2A2A2A),
    surfaceContainerHighest: Color(0xFF303030),

    onSurfaceVariant: Color(0xFFAAAAAA),

    inverseSurface: Color(0xFFEFEFEF),
    onInverseSurface: Color(0xFF1A1A1A),

    inversePrimary: Color(0xFF0A6F77), // original light primary

    outline: Color(0xFF444444),
    outlineVariant: Color(0xFF2D2D2D),

    shadow: Color(0xBF000000),
    scrim: Color(0x99000000),
    surfaceTint: Color(0xFF4DB8BF),
  ),

  scaffoldBackgroundColor: const Color(0xFF121212),
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.transparent,
    backgroundColor: Color(0xFF121212),
    foregroundColor: Color(0xFFEFEFEF),
    elevation: 0,
  ),

  cardColor: const Color(0xFF1E1E1E),

  dividerColor: const Color(0xFF2C2C2C),

  textTheme: TextTheme(
    bodyLarge: const TextStyle(
      color: Color(0xFFEFEFEF),
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: GoogleFonts.dmSans(
      color: const Color(0xFFCCCCCC),
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: GoogleFonts.dmSans(
      color: const Color(0xFF999999),
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: const TextStyle(
      color: Color(0xFFEFEFEF),
      fontWeight: FontWeight.bold,
    ),
    titleSmall: GoogleFonts.dmSans(
      color: const Color(0xFFEFEFEF),
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ),
  ),

  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xFF4DB8BF),
    selectionColor: Color(0x5536CFCF),
    selectionHandleColor: Color(0xFF4DB8BF),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF1E1E1E),
    border: _buildBorder(color: const Color(0xFF2D2D2D)),
    enabledBorder: _buildBorder(color: const Color(0xFF4DB8BF)),
    focusedBorder: _buildBorder(color: const Color(0xFF4DB8BF)),
    disabledBorder: _buildBorder(color: const Color(0xFF2D2D2D)),
    errorBorder: _buildBorder(color: const Color(0xFFFF6B6B)),
    hintStyle: GoogleFonts.dmSans(fontSize: 14, color: const Color(0xFF888888)),
    labelStyle: GoogleFonts.dmSans(
      fontSize: 14,
      color: const Color(0xFFAAAAAA),
    ),
  ),
);

OutlineInputBorder _buildBorder({required Color color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: color),
  );
}
