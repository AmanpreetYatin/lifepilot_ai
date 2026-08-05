import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle get largeTitle => GoogleFonts.plusJakartaSans(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get body => GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get button => GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.w600, // SemiBold
      );
}
