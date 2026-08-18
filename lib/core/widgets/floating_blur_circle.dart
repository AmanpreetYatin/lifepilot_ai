import 'dart:ui';

import 'package:flutter/material.dart';

class FloatingBlurCircle extends StatefulWidget {
  const FloatingBlurCircle({
    super.key,
    required this.color,
    required this.size,
    required this.alignment,
    this.duration = const Duration(seconds: 10),
    this.offset = const Offset(25, 20),
  });

  final Color color;
  final double size;
  final Alignment alignment;
  final Duration duration;
  final Offset offset;

  @override
  State<FloatingBlurCircle> createState() => _FloatingBlurCircleState();
}

class _FloatingBlurCircleState extends State<FloatingBlurCircle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _dx;
  late final Animation<double> _dy;
  late final Animation<double> _rotation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);

    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _dx = Tween<double>(
      begin: -widget.offset.dx,
      end: widget.offset.dx,
    ).animate(curve);

    _dy = Tween<double>(
      begin: -widget.offset.dy,
      end: widget.offset.dy,
    ).animate(curve);

    _rotation = Tween<double>(
      begin: -0.08,
      end: 0.08,
    ).animate(curve);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Transform.translate(
            offset: Offset(_dx.value, _dy.value),
            child: Transform.rotate(
              angle: _rotation.value,
              child: child,
            ),
          );
        },
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: 60,
            sigmaY: 60,
          ),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color,
            ),
          ),
        ),
      ),
    );
  }
}