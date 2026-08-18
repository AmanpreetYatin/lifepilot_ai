import 'package:flutter/material.dart';

import '../design_system/app_colors.dart';

class LoadingDots extends StatefulWidget {
  const LoadingDots({
    super.key,
    this.dotSize = 10,
    this.spacing = 10,
    this.color = AppColors.primary,
    this.duration = const Duration(milliseconds: 900),
  });

  final double dotSize;
  final double spacing;
  final Color color;
  final Duration duration;

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _scaleForDot(int index) {
    final progress = (_controller.value * 3 - index).clamp(0.0, 1.0);

    return Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).transform(
      Curves.easeInOut.transform(progress),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            3,
                (index) {
              final scale = _scaleForDot(index);

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.spacing / 2,
                ),
                child: Transform.scale(
                  scale: scale,
                  child: Opacity(
                    opacity: scale,
                    child: Container(
                      width: widget.dotSize,
                      height: widget.dotSize,
                      decoration: BoxDecoration(
                        color: widget.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}