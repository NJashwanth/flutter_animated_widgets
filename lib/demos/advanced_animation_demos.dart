import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../widgets/demo_container.dart';
import '../widgets/sample_box.dart';

class OrbitingDotsDemo extends StatefulWidget {
  const OrbitingDotsDemo({
    super.key,
    this.duration = const Duration(seconds: 5),
    this.dotCount = 10,
  });

  final Duration duration;
  final int dotCount;

  @override
  State<OrbitingDotsDemo> createState() => _OrbitingDotsDemoState();
}

class _OrbitingDotsDemoState extends State<OrbitingDotsDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoContainer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final t = _controller.value * 2 * math.pi;
          return Stack(
            alignment: Alignment.center,
            children: [
              for (var i = 0; i < widget.dotCount; i++)
                Transform.translate(
                  offset: Offset.fromDirection(
                    t + (i * (2 * math.pi / widget.dotCount)),
                    38 + (i % 3) * 8,
                  ),
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              const SampleBox(icon: Icons.blur_on),
            ],
          );
        },
      ),
    );
  }
}

class GlassCube3dDemo extends StatefulWidget {
  const GlassCube3dDemo({
    super.key,
    this.duration = const Duration(seconds: 4),
  });

  final Duration duration;

  @override
  State<GlassCube3dDemo> createState() => _GlassCube3dDemoState();
}

class _GlassCube3dDemoState extends State<GlassCube3dDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoContainer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final value = _controller.value;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0015)
              ..rotateX(value * 2 * math.pi)
              ..rotateY(value * math.pi),
            child: Container(
              width: 92,
              height: 92,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withValues(alpha: 0.45),
                    Colors.white.withValues(alpha: 0.15),
                  ],
                ),
                border: Border.all(color: Colors.white.withValues(alpha: 0.35)),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.25),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: const Icon(
                Icons.view_in_ar,
                color: Colors.white,
                size: 42,
              ),
            ),
          );
        },
      ),
    );
  }
}

class WaveLineDemo extends StatefulWidget {
  const WaveLineDemo({super.key, this.duration = const Duration(seconds: 3)});

  final Duration duration;

  @override
  State<WaveLineDemo> createState() => _WaveLineDemoState();
}

class _WaveLineDemoState extends State<WaveLineDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoContainer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            size: const Size(160, 90),
            painter: _WavePainter(
              progress: _controller.value,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          );
        },
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  _WavePainter({required this.progress, required this.color});

  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..shader = LinearGradient(
        colors: [color.withValues(alpha: 0.2), color, Colors.white],
      ).createShader(Offset.zero & size);

    final path = Path();
    for (double x = 0; x <= size.width; x += 2) {
      final y =
          size.height / 2 +
          math.sin((x / size.width * 4 * math.pi) + progress * 2 * math.pi) *
              18;
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _WavePainter oldDelegate) {
    return progress != oldDelegate.progress || color != oldDelegate.color;
  }
}

class MorphingBlobDemo extends StatefulWidget {
  const MorphingBlobDemo({
    super.key,
    this.duration = const Duration(seconds: 4),
  });

  final Duration duration;

  @override
  State<MorphingBlobDemo> createState() => _MorphingBlobDemoState();
}

class _MorphingBlobDemoState extends State<MorphingBlobDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _radius;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
    _radius = Tween<double>(
      begin: 16,
      end: 48,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoContainer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final value = _controller.value;
          return Transform.rotate(
            angle: value * 2 * math.pi,
            child: Container(
              width: 108,
              height: 108,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_radius.value),
                  topRight: Radius.circular(58 - _radius.value * 0.6),
                  bottomLeft: Radius.circular(52 - _radius.value * 0.4),
                  bottomRight: Radius.circular(_radius.value),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ParticleFieldDemo extends StatefulWidget {
  const ParticleFieldDemo({
    super.key,
    this.duration = const Duration(seconds: 6),
    this.count = 26,
  });

  final Duration duration;
  final int count;

  @override
  State<ParticleFieldDemo> createState() => _ParticleFieldDemoState();
}

class _ParticleFieldDemoState extends State<ParticleFieldDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoContainer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final t = _controller.value;
          return CustomPaint(
            size: const Size(170, 120),
            painter: _ParticlePainter(
              progress: t,
              color: Theme.of(context).colorScheme.primary,
              count: widget.count,
            ),
          );
        },
      ),
    );
  }
}

class _ParticlePainter extends CustomPainter {
  _ParticlePainter({
    required this.progress,
    required this.color,
    required this.count,
  });

  final double progress;
  final Color color;
  final int count;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()..style = PaintingStyle.fill;

    for (var i = 0; i < count; i++) {
      final seed = i / count;
      final angle = (seed * 2 * math.pi) + (progress * 2 * math.pi);
      final radius = 10 + ((seed * 60) + progress * 50) % 70;
      final dot = center + Offset.fromDirection(angle, radius);
      final alpha = (0.2 + 0.8 * (1 - (radius / 80))).clamp(0.1, 1.0);
      paint.color = color.withValues(alpha: alpha);
      canvas.drawCircle(dot, 2 + (seed * 3), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) {
    return progress != oldDelegate.progress || color != oldDelegate.color;
  }
}
