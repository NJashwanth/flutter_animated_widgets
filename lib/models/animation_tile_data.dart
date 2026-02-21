import 'package:flutter/material.dart';

class AnimationExampleData {
  const AnimationExampleData({
    required this.title,
    required this.subtitle,
    required this.demoBuilder,
  });

  final String title;
  final String subtitle;
  final Widget Function() demoBuilder;
}

class AnimationTileData {
  const AnimationTileData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.examples,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final List<AnimationExampleData> examples;
}
