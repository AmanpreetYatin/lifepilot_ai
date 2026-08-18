import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../design_system/app_colors.dart';

class AnimatedGradientBackground extends StatefulWidget {
  final Widget child;

  const AnimatedGradientBackground({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState
    extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Alignment _alignment(double angle) {
    return Alignment(
      math.cos(angle),
      math.sin(angle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final value = _controller.value;

        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: _alignment(value * math.pi * 2),
              end: _alignment((value + .5) * math.pi * 2),
              colors: const [
                AppColors.backgroundLight,
                Color(0xffEEF2FF),
                Color(0xffE0F2FE),
                Color(0xffF5F3FF),
              ],
            ),
          ),
          child: widget.child,
        );
      },
    );
  }
}