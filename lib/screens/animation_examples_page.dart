import 'package:flutter/material.dart';

import '../models/animation_tile_data.dart';
import '../widgets/aurora_background.dart';

class AnimationExamplesPage extends StatelessWidget {
  const AnimationExamplesPage({super.key, required this.item});

  final AnimationTileData item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: AuroraBackground(
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
          itemCount: item.examples.length,
          itemBuilder: (context, index) {
            final example = item.examples[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.2),
                            ),
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              example.title,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(example.subtitle),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 210,
                        child: Center(child: example.demoBuilder()),
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
