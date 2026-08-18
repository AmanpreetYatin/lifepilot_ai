import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../domain/entities/onboarding_item.dart';

const onboardingItems = [
  OnboardingItem(
    title: 'Plan Smarter,\nNot Harder',
    description:
    'Manage your tasks, goals and daily schedule with an intelligent AI assistant.',
    image: 'assets/images/onboarding/onboarding_1.png',
    startColor: AppColors.primary,
    endColor: AppColors.secondary,
  ),
  OnboardingItem(
    title: 'AI That\nWorks For You',
    description:
    'Simply type naturally. LifePilot understands your intent and performs actions automatically.',
    image: 'assets/images/onboarding/onboarding_2.png',
    startColor: Color(0xff7C4DFF),
    endColor: Color(0xff42A5F5),
  ),
  OnboardingItem(
    title: 'Everything\nIn One Place',
    description:
    'Tasks, expenses, documents and productivity tools beautifully organized in one app.',
    image: 'assets/images/onboarding/onboarding_3.png',
    startColor: Color(0xff4F46E5),
    endColor: Color(0xff06B6D4),
  ),
];