import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  AppTypography._();

  static TextTheme textTheme = GoogleFonts.plusJakartaSansTextTheme(
    const TextTheme(
      displayLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w700,
      ),
      headlineLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}