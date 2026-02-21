import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class AuroraBackground extends StatefulWidget {
  const AuroraBackground({super.key, required this.child});

  final Widget child;

  @override
  State<AuroraBackground> createState() => _AuroraBackgroundState();
}

class _AuroraBackgroundState extends State<AuroraBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final t = _controller.value * 2 * math.pi;

        return Stack(
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colors.surface,
                    colors.surfaceContainerHighest.withValues(alpha: 0.92),
                    colors.surface,
                  ],
                ),
              ),
            ),
            _GlowOrb(
              alignment: Alignment(math.sin(t) * 0.8, -0.75),
              color: colors.primary.withValues(alpha: 0.24),
              size: 260,
            ),
            _GlowOrb(
              alignment: Alignment(-0.85, math.cos(t * 0.8) * 0.6),
              color: colors.tertiary.withValues(alpha: 0.2),
              size: 220,
            ),
            _GlowOrb(
              alignment: Alignment(0.9, math.sin(t * 1.2) * 0.7),
              color: colors.secondary.withValues(alpha: 0.18),
              size: 240,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: const SizedBox.expand(),
            ),
            widget.child,
          ],
        );
      },
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({
    required this.alignment,
    required this.color,
    required this.size,
  });

  final Alignment alignment;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [color, Colors.transparent],
            stops: const [0.2, 1],
          ),
        ),
      ),
    );
  }
}
