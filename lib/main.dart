import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animated Widgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) {
        return;
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AnimationHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.animation,
              size: 84,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Flutter Animated Widgets',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class AnimationHomePage extends StatelessWidget {
  const AnimationHomePage({super.key});

  static final List<AnimationTileData> _items = [
    AnimationTileData(
      title: 'Fade Animation',
      subtitle: 'AnimatedOpacity',
      icon: Icons.visibility,
      demoBuilder: () => const FadeDemo(),
    ),
    AnimationTileData(
      title: 'Scale Animation',
      subtitle: 'TweenAnimationBuilder',
      icon: Icons.zoom_in,
      demoBuilder: () => const ScaleDemo(),
    ),
    AnimationTileData(
      title: 'Rotation Animation',
      subtitle: 'RotationTransition',
      icon: Icons.rotate_right,
      demoBuilder: () => const RotationDemo(),
    ),
    AnimationTileData(
      title: 'Slide Animation',
      subtitle: 'AnimatedSlide',
      icon: Icons.swipe,
      demoBuilder: () => const SlideDemo(),
    ),
    AnimationTileData(
      title: 'Size Animation',
      subtitle: 'AnimatedContainer',
      icon: Icons.aspect_ratio,
      demoBuilder: () => const SizeDemo(),
    ),
    AnimationTileData(
      title: 'Color Animation',
      subtitle: 'AnimatedContainer color tween',
      icon: Icons.palette,
      demoBuilder: () => const ColorDemo(),
    ),
    AnimationTileData(
      title: 'Hero Animation',
      subtitle: 'Hero transition between screens',
      icon: Icons.flight,
      demoBuilder: () => const HeroDemo(),
    ),
    AnimationTileData(
      title: 'Staggered Animation',
      subtitle: 'Interval-based animation',
      icon: Icons.auto_awesome,
      demoBuilder: () => const StaggeredDemo(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Gallery')),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Icon(item.icon),
              title: Text(item.title),
              subtitle: Text(item.subtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AnimationDemoPage(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class AnimationTileData {
  const AnimationTileData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.demoBuilder,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Widget Function() demoBuilder;
}

class AnimationDemoPage extends StatelessWidget {
  const AnimationDemoPage({super.key, required this.item});

  final AnimationTileData item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: Center(child: item.demoBuilder()),
    );
  }
}

class FadeDemo extends StatefulWidget {
  const FadeDemo({super.key});

  @override
  State<FadeDemo> createState() => _FadeDemoState();
}

class _FadeDemoState extends State<FadeDemo> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return _DemoContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _visible ? 1 : 0.2,
            duration: const Duration(milliseconds: 700),
            child: _sampleBox(),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: () => setState(() => _visible = !_visible),
            child: const Text('Toggle Fade'),
          ),
        ],
      ),
    );
  }
}

class ScaleDemo extends StatefulWidget {
  const ScaleDemo({super.key});

  @override
  State<ScaleDemo> createState() => _ScaleDemoState();
}

class _ScaleDemoState extends State<ScaleDemo> {
  bool _large = false;

  @override
  Widget build(BuildContext context) {
    return _DemoContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 1, end: _large ? 1.8 : 1),
            duration: const Duration(milliseconds: 450),
            builder: (context, value, child) {
              return Transform.scale(scale: value, child: child);
            },
            child: _sampleBox(),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: () => setState(() => _large = !_large),
            child: const Text('Toggle Scale'),
          ),
        ],
      ),
    );
  }
}

class RotationDemo extends StatefulWidget {
  const RotationDemo({super.key});

  @override
  State<RotationDemo> createState() => _RotationDemoState();
}

class _RotationDemoState extends State<RotationDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _DemoContainer(
      child: RotationTransition(turns: _controller, child: _sampleBox()),
    );
  }
}

class SlideDemo extends StatefulWidget {
  const SlideDemo({super.key});

  @override
  State<SlideDemo> createState() => _SlideDemoState();
}

class _SlideDemoState extends State<SlideDemo> {
  bool _moved = false;

  @override
  Widget build(BuildContext context) {
    return _DemoContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSlide(
            offset: _moved ? const Offset(1.2, 0) : Offset.zero,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: _sampleBox(),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: () => setState(() => _moved = !_moved),
            child: const Text('Toggle Slide'),
          ),
        ],
      ),
    );
  }
}

class SizeDemo extends StatefulWidget {
  const SizeDemo({super.key});

  @override
  State<SizeDemo> createState() => _SizeDemoState();
}

class _SizeDemoState extends State<SizeDemo> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return _DemoContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 450),
            curve: Curves.easeInOut,
            width: _expanded ? 180 : 90,
            height: _expanded ? 180 : 90,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: () => setState(() => _expanded = !_expanded),
            child: const Text('Toggle Size'),
          ),
        ],
      ),
    );
  }
}

class ColorDemo extends StatefulWidget {
  const ColorDemo({super.key});

  @override
  State<ColorDemo> createState() => _ColorDemoState();
}

class _ColorDemoState extends State<ColorDemo> {
  bool _changed = false;

  @override
  Widget build(BuildContext context) {
    return _DemoContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: _changed
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: () => setState(() => _changed = !_changed),
            child: const Text('Change Color'),
          ),
        ],
      ),
    );
  }
}

class HeroDemo extends StatelessWidget {
  const HeroDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return _DemoContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const HeroDetailPage()));
            },
            child: Hero(
              tag: 'hero-box',
              child: _sampleBox(icon: Icons.flight),
            ),
          ),
          const SizedBox(height: 18),
          const Text('Tap the box to see Hero transition'),
        ],
      ),
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  const HeroDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Detail')),
      body: Center(
        child: Hero(
          tag: 'hero-box',
          child: Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Icon(Icons.flight, color: Colors.white, size: 72),
          ),
        ),
      ),
    );
  }
}

class StaggeredDemo extends StatefulWidget {
  const StaggeredDemo({super.key});

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
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);

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
    return _DemoContainer(
      child: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: _slide,
          child: ScaleTransition(
            scale: _scale,
            child: _sampleBox(icon: Icons.auto_awesome),
          ),
        ),
      ),
    );
  }
}

class _DemoContainer extends StatelessWidget {
  const _DemoContainer({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16), child: child);
  }
}

Widget _sampleBox({IconData icon = Icons.star}) {
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Icon(icon, color: Colors.white, size: 40),
  );
}
