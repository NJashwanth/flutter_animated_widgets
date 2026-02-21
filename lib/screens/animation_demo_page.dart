import 'package:flutter/material.dart';

import '../models/animation_tile_data.dart';

class AnimationDemoPage extends StatelessWidget {
  const AnimationDemoPage({super.key, required this.example});

  final AnimationExampleData example;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(example.title)),
      body: Center(child: example.demoBuilder()),
    );
  }
}
