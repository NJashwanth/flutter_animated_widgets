import 'package:flutter/material.dart';

import '../widgets/demo_container.dart';
import '../widgets/sample_box.dart';

class FadeDemo extends StatefulWidget {
  const FadeDemo({
    super.key,
    this.minOpacity = 0.2,
    this.duration = const Duration(milliseconds: 700),
  });

  final double minOpacity;
  final Duration duration;

  @override
  State<FadeDemo> createState() => _FadeDemoState();
}

class _FadeDemoState extends State<FadeDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
    _opacity = Tween<double>(
      begin: widget.minOpacity,
      end: 1,
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
      child: FadeTransition(opacity: _opacity, child: const SampleBox()),
    );
  }
}

class ScaleDemo extends StatefulWidget {
  const ScaleDemo({
    super.key,
    this.startScale = 1,
    this.endScale = 1.8,
    this.duration = const Duration(milliseconds: 450),
  });

  final double startScale;
  final double endScale;
  final Duration duration;

  @override
  State<ScaleDemo> createState() => _ScaleDemoState();
}

class _ScaleDemoState extends State<ScaleDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
    _scale = Tween<double>(
      begin: widget.startScale,
      end: widget.endScale,
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
      child: ScaleTransition(scale: _scale, child: const SampleBox()),
    );
  }
}

class RotationDemo extends StatefulWidget {
  const RotationDemo({super.key, this.duration = const Duration(seconds: 2)});

  final Duration duration;

  @override
  State<RotationDemo> createState() => _RotationDemoState();
}

class _RotationDemoState extends State<RotationDemo>
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
      child: RotationTransition(turns: _controller, child: const SampleBox()),
    );
  }
}

class SlideDemo extends StatefulWidget {
  const SlideDemo({
    super.key,
    this.endOffset = const Offset(1.2, 0),
    this.duration = const Duration(milliseconds: 500),
  });

  final Offset endOffset;
  final Duration duration;

  @override
  State<SlideDemo> createState() => _SlideDemoState();
}

class _SlideDemoState extends State<SlideDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
    _slide = Tween<Offset>(
      begin: Offset.zero,
      end: widget.endOffset,
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
      child: SlideTransition(position: _slide, child: const SampleBox()),
    );
  }
}

class SizeDemo extends StatefulWidget {
  const SizeDemo({
    super.key,
    this.smallSize = 90,
    this.largeSize = 180,
    this.duration = const Duration(milliseconds: 450),
  });

  final double smallSize;
  final double largeSize;
  final Duration duration;

  @override
  State<SizeDemo> createState() => _SizeDemoState();
}

class _SizeDemoState extends State<SizeDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _size;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
    _size = Tween<double>(
      begin: widget.smallSize,
      end: widget.largeSize,
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
        animation: _size,
        builder: (context, _) {
          return Container(
            width: _size.value,
            height: _size.value,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
          );
        },
      ),
    );
  }
}

class ColorDemo extends StatefulWidget {
  const ColorDemo({
    super.key,
    this.firstColor,
    this.secondColor,
    this.duration = const Duration(milliseconds: 500),
  });

  final Color? firstColor;
  final Color? secondColor;
  final Duration duration;

  @override
  State<ColorDemo> createState() => _ColorDemoState();
}

class _ColorDemoState extends State<ColorDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Color?> _color;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final first = widget.firstColor ?? Theme.of(context).colorScheme.primary;
    final second =
        widget.secondColor ?? Theme.of(context).colorScheme.secondary;
    _color = ColorTween(
      begin: first,
      end: second,
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
        animation: _color,
        builder: (context, _) {
          return Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: _color.value,
              borderRadius: BorderRadius.circular(18),
            ),
          );
        },
      ),
    );
  }
}

class HeroDemo extends StatefulWidget {
  const HeroDemo({
    super.key,
    this.icon = Icons.flight,
    this.duration = const Duration(milliseconds: 1600),
  });

  final IconData icon;
  final Duration duration;

  @override
  State<HeroDemo> createState() => _HeroDemoState();
}

class _HeroDemoState extends State<HeroDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _position;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
    _position = Tween<Offset>(
      begin: const Offset(-0.7, 0),
      end: const Offset(0.7, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _scale = Tween<double>(
      begin: 0.85,
      end: 1.15,
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
          return FractionalTranslation(
            translation: _position.value,
            child: Transform.scale(
              scale: _scale.value,
              child: SampleBox(icon: widget.icon),
            ),
          );
        },
      ),
    );
  }
}

class StaggeredDemo extends StatefulWidget {
  const StaggeredDemo({
    super.key,
    this.duration = const Duration(milliseconds: 1400),
    this.icon = Icons.auto_awesome,
  });

  final Duration duration;
  final IconData icon;

  @override
  State<StaggeredDemo> createState() => _StaggeredDemoState();
}

class _StaggeredDemoState extends State<StaggeredDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<double> _scale;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);

    _fade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.35, curve: Curves.easeIn),
    );
    _scale = Tween<double>(begin: 0.7, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.35, 0.7, curve: Curves.easeOutBack),
      ),
    );
    _slide = Tween<Offset>(begin: const Offset(0, 0.35), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.7, 1.0, curve: Curves.easeOut),
          ),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoContainer(
      child: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: _slide,
          child: ScaleTransition(
            scale: _scale,
            child: SampleBox(icon: widget.icon),
          ),
        ),
      ),
    );
  }
}
