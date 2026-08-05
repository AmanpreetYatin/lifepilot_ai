import 'package:flutter/material.dart';

import '../../core/design_system/app_colors.dart';
import '../../core/design_system/app_typography.dart';

ThemeData darkTheme() {
  return ThemeData(
    useMaterial3: true,

    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.backgroundDark,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),

    textTheme: AppTypography.textTheme,
  );
}