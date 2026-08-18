import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/design_system/app_colors.dart';
import '../../../../core/widgets/animated_gradient_background.dart';
import '../../../../core/widgets/brand_logo.dart';
import '../../../../core/widgets/floating_blur_circle.dart';
import '../../../../core/widgets/loading_dots.dart';

class SplashContent extends StatefulWidget {
  const SplashContent({super.key});

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller;

  late final Animation<double> _fade;

  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _scale = Tween(
      begin: .85,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _controller.forward();

    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(
      const Duration(milliseconds: 2600),
    );

    if (!mounted) return;

    context.go(AppRoutes.onboarding);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBackground(
      child: Stack(
        children: [

          FloatingBlurCircle(
            size: 260,
            alignment: Alignment.topLeft,
            color: Colors.indigo.withOpacity(.15),
          ),

          FloatingBlurCircle(
            size: 220,
            alignment: Alignment.topRight,
            duration: const Duration(seconds: 14),
            color: Colors.purple.withOpacity(.18),
          ),

          FloatingBlurCircle(
            size: 300,
            alignment: Alignment.bottomCenter,
            duration: const Duration(seconds: 16),
            color: Colors.blue.withOpacity(.15),
          ),

          SafeArea(
            child: Center(
              child: FadeTransition(
                opacity: _fade,
                child: ScaleTransition(
                  scale: _scale,
                  child: const BrandLogo(),
                ),
              ),
            ),
          ),

          const Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(
              child: LoadingDots(),
            ),
          ),
        ],
      ),
    );
  }
}