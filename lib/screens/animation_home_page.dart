import 'package:flutter/material.dart';

import '../widgets/aurora_background.dart';
import 'advanced_animations_page.dart';
import 'basic_animations_page.dart';

class AnimationHomePage extends StatelessWidget {
  const AnimationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Gallery'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.auto_awesome),
          ),
        ],
      ),
      body: AuroraBackground(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 18, 14, 22),
          child: Column(
            children: [
              _HomeCategoryCard(
                title: 'Basic Animation',
                subtitle: 'All currently implemented animations',
                icon: Icons.auto_awesome_motion,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const BasicAnimationsPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 14),
              _HomeCategoryCard(
                title: 'Advance Animations',
                subtitle: 'Premium motion section for next phase',
                icon: Icons.bolt,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const AdvancedAnimationsPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeCategoryCard extends StatelessWidget {
  const _HomeCategoryCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.tertiary,
                      ],
                    ),
                  ),
                  child: Icon(icon, color: Colors.white),
                ),
                const Spacer(),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(subtitle),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
