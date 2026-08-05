import 'package:flutter/material.dart';

import '../../core/design_system/app_colors.dart';
import '../../core/design_system/app_typography.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,

    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColors.backgroundLight,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),

    textTheme: AppTypography.textTheme,
  );
}