import 'package:flutter/material.dart';

import '../widgets/aurora_background.dart';

class SplashScreen extends StatefulWidget {
  final void Function(ThemeMode)? onThemeChange;
  final VoidCallback? onSplashComplete;
  const SplashScreen({super.key, this.onThemeChange, this.onSplashComplete});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      widget.onSplashComplete?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuroraBackground(
        child: Stack(
          children: [
            Center(
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.85, end: 1),
                duration: const Duration(milliseconds: 1200),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  return Transform.scale(scale: value, child: child);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 28,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Theme.of(
                      context,
                    ).colorScheme.surface.withValues(alpha: 0.92),
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).colorScheme.outline.withValues(alpha: 0.18),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.22),
                        blurRadius: 34,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        size: 74,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'Flutter Animated Widgets',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Immersive motion playground',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.82),
                        ),
                      ),
                      const SizedBox(height: 18),
                      const CircularProgressIndicator(strokeWidth: 2.8),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 32,
              right: 32,
              child: IconButton(
                icon: Icon(
                  Icons.brightness_6,
                  size: 28,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.85),
                ),
                tooltip: 'Change theme',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Select Theme'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.light_mode),
                              title: const Text('Light'),
                              onTap: () {
                                Navigator.of(context).pop();
                                widget.onThemeChange?.call(ThemeMode.light);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.dark_mode),
                              title: const Text('Dark'),
                              onTap: () {
                                Navigator.of(context).pop();
                                widget.onThemeChange?.call(ThemeMode.dark);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.settings),
                              title: const Text('System'),
                              onTap: () {
                                Navigator.of(context).pop();
                                widget.onThemeChange?.call(ThemeMode.system);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
