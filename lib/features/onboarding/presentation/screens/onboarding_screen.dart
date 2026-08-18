import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/widgets/animated_gradient_background.dart';
import '../../../../core/widgets/floating_blur_circle.dart';
import '../constants/onboarding_data.dart';
import '../providers/onboarding_provider.dart';
import '../widgets/onboarding_button.dart';
import '../widgets/onboarding_indicator.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/skip_button.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends ConsumerState<OnboardingScreen> {
  late final PageController _pageController;

  double _page = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _pageController.addListener(() {
      if (!mounted) return;

      setState(() {
        _page = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    final notifier =
    ref.read(onboardingProvider.notifier);

    /*if (notifier.isLastPage) {
      _completeOnboarding();
      return;
    }*/

    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
    );
  }

  void _skip() {
    _completeOnboarding();
  }

  void _completeOnboarding() {
    context.go(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final currentPage =
    ref.watch(onboardingProvider);

    final isLastPage =
        currentPage == onboardingItems.length - 1;

    final currentItem =
    onboardingItems[currentPage];

    return Scaffold(
      body: AnimatedGradientBackground(
        child: Stack(
          children: [
            FloatingBlurCircle(
              size: 280,
              color: currentItem.startColor
                  .withValues(alpha: 0.12),
              alignment: Alignment.topLeft,
              duration: const Duration(seconds: 12),
            ),

            FloatingBlurCircle(
              size: 240,
              color: currentItem.endColor
                  .withValues(alpha: 0.12),
              alignment: Alignment.bottomRight,
              duration: const Duration(seconds: 15),
            ),

            SafeArea(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SkipButton(
                      onPressed: _skip,
                    ),
                  ),

                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: onboardingItems.length,
                      onPageChanged: (index) {
                        ref
                            .read(
                          onboardingProvider.notifier,
                        )
                            .setPage(index);
                      },
                      itemBuilder: (context, index) {
                        return OnboardingPage(
                          item: onboardingItems[index],
                          pageIndex: index,
                          pageOffset: _page,
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      24,
                      12,
                      24,
                      24,
                    ),
                    child: Column(
                      children: [
                        OnboardingIndicator(
                          currentPage: currentPage,
                          itemCount: onboardingItems.length,
                        ),

                        const SizedBox(height: 28),

                        OnboardingButton(
                          isLastPage: isLastPage,
                          onPressed: _nextPage,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}