import 'package:flutter/material.dart';

import '../../domain/entities/onboarding_item.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.item,
    required this.pageIndex,
    required this.pageOffset,
  });

  final OnboardingItem item;
  final int pageIndex;
  final double pageOffset;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    final distance = (pageOffset - pageIndex).abs();
    final animationValue = (1 - distance).clamp(0.0, 1.0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 24),

          Expanded(
            flex: 6,
            child: Center(
              child: Transform.translate(
                offset: Offset(
                  (1 - animationValue) * 60,
                  0,
                ),
                child: Transform.scale(
                  scale: 0.88 + (animationValue * 0.12),
                  child: Opacity(
                    opacity: animationValue,
                    child: _Illustration(
                      item: item,
                      size: size.width * 0.72,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            flex: 4,
            child: Transform.translate(
              offset: Offset(
                0,
                (1 - animationValue) * 30,
              ),
              child: Opacity(
                opacity: animationValue,
                child: Column(
                  children: [
                    Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        height: 1.12,
                        letterSpacing: -0.6,
                        color: const Color(0xFF111827),
                      ),
                    ),

                    const SizedBox(height: 16),

                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 360,
                      ),
                      child: Text(
                        item.description,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          height: 1.5,
                          color: const Color(0xFF4B5563),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Illustration extends StatelessWidget {
  const _Illustration({
    required this.item,
    required this.size,
  });

  final OnboardingItem item;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      constraints: const BoxConstraints(
        maxWidth: 340,
        maxHeight: 340,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            item.startColor.withValues(alpha: 0.18),
            item.endColor.withValues(alpha: 0.08),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: item.startColor.withValues(alpha: 0.12),
            blurRadius: 50,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Image.asset(
          item.image,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) {
            return Icon(
              Icons.auto_awesome_rounded,
              size: size * 0.28,
              color: item.startColor,
            );
          },
        ),
      ),
    );
  }
}