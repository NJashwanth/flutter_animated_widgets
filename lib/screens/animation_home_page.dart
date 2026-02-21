import 'package:flutter/material.dart';

import '../data/animation_items.dart';
import 'animation_examples_page.dart';

class AnimationHomePage extends StatelessWidget {
  const AnimationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = animationItems();

    return Scaffold(
      appBar: AppBar(title: const Text('Animation Gallery')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
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
                    builder: (_) => AnimationExamplesPage(item: item),
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
