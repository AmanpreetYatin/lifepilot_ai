import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lifepilot_ai/core/constants/app_constants.dart';

import '../design_system/app_colors.dart';
import '../design_system/app_spacing.dart';

class BrandLogo extends StatelessWidget {
  const BrandLogo({
    super.key,
    this.size = 90,
    this.showTitle = true,
    this.showSubtitle = true,
    this.heroTag = 'brand-logo',
  });

  final double size;
  final bool showTitle;
  final bool showSubtitle;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Hero(
      tag: heroTag,
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/logos/brand_logo.png',
              width: size,
              height: size,
            ),

            if (showTitle) ...[
              const SizedBox(height: AppSpacing.lg),

              Text(
                AppConstants.appName,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
            ],

            if (showSubtitle) ...[
              const SizedBox(height: AppSpacing.sm),

              Text(
                AppConstants.appTagline,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}