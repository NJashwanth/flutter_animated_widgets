import 'package:flutter/material.dart';

import '../data/advanced_animation_items.dart';
import '../widgets/aurora_background.dart';
import 'animation_examples_page.dart';

class AdvancedAnimationsPage extends StatelessWidget {
  const AdvancedAnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = advancedAnimationItems();

    return Scaffold(
      appBar: AppBar(title: const Text('Advance Animations')),
      body: AuroraBackground(
        child: GridView.builder(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 370,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            mainAxisExtent: 190,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AnimationExamplesPage(item: item),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).colorScheme.primary,
                              Theme.of(context).colorScheme.tertiary,
                            ],
                          ),
                        ),
                        child: Icon(item.icon, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            '${item.examples.length} examples',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
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
            );
          },
        ),
      ),
    );
  }
}
