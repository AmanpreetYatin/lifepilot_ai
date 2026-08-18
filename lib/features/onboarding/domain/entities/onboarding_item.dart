import 'package:flutter/material.dart';

@immutable
class OnboardingItem {
  const OnboardingItem({
    required this.title,
    required this.description,
    required this.image,
    required this.startColor,
    required this.endColor,
  });

  final String title;
  final String description;
  final String image;

  /// Used for page background animation
  final Color startColor;
  final Color endColor;
}