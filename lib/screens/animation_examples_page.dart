import 'package:flutter/material.dart';

import '../models/animation_tile_data.dart';

class AnimationExamplesPage extends StatelessWidget {
  const AnimationExamplesPage({super.key, required this.item});

  final AnimationTileData item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: ListView.builder(
        itemCount: item.examples.length,
        itemBuilder: (context, index) {
          final example = item.examples[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    example.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(example.subtitle),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 210,
                    child: Center(child: example.demoBuilder()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
