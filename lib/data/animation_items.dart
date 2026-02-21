import 'package:flutter/material.dart';

import '../demos/animation_demos.dart';
import '../models/animation_tile_data.dart';

List<AnimationTileData> animationItems() {
  return [
    const AnimationTileData(
      title: 'Fade Animation',
      subtitle: '2 examples',
      icon: Icons.visibility,
      examples: [
        AnimationExampleData(
          title: 'Fade Example 1',
          subtitle: 'Auto fade loop',
          demoBuilder: FadeDemo.new,
        ),
        AnimationExampleData(
          title: 'Fade Example 2',
          subtitle: 'Soft auto fade loop',
          demoBuilder: _buildFadeAlt,
        ),
      ],
    ),
    const AnimationTileData(
      title: 'Scale Animation',
      subtitle: '2 examples',
      icon: Icons.zoom_in,
      examples: [
        AnimationExampleData(
          title: 'Scale Example 1',
          subtitle: 'Auto scale loop',
          demoBuilder: ScaleDemo.new,
        ),
        AnimationExampleData(
          title: 'Scale Example 2',
          subtitle: 'Wider scale range',
          demoBuilder: _buildScaleAlt,
        ),
      ],
    ),
    const AnimationTileData(
      title: 'Rotation Animation',
      subtitle: '2 examples',
      icon: Icons.rotate_right,
      examples: [
        AnimationExampleData(
          title: 'Rotation Example 1',
          subtitle: 'Normal speed spin',
          demoBuilder: RotationDemo.new,
        ),
        AnimationExampleData(
          title: 'Rotation Example 2',
          subtitle: 'Fast spin variation',
          demoBuilder: _buildRotationAlt,
        ),
      ],
    ),
    const AnimationTileData(
      title: 'Slide Animation',
      subtitle: '2 examples',
      icon: Icons.swipe,
      examples: [
        AnimationExampleData(
          title: 'Slide Example 1',
          subtitle: 'Auto horizontal slide loop',
          demoBuilder: SlideDemo.new,
        ),
        AnimationExampleData(
          title: 'Slide Example 2',
          subtitle: 'Diagonal slide variation',
          demoBuilder: _buildSlideAlt,
        ),
      ],
    ),
    const AnimationTileData(
      title: 'Size Animation',
      subtitle: '2 examples',
      icon: Icons.aspect_ratio,
      examples: [
        AnimationExampleData(
          title: 'Size Example 1',
          subtitle: 'Auto size loop',
          demoBuilder: SizeDemo.new,
        ),
        AnimationExampleData(
          title: 'Size Example 2',
          subtitle: 'Bigger growth range',
          demoBuilder: _buildSizeAlt,
        ),
      ],
    ),
    const AnimationTileData(
      title: 'Color Animation',
      subtitle: '2 examples',
      icon: Icons.palette,
      examples: [
        AnimationExampleData(
          title: 'Color Example 1',
          subtitle: 'Auto color loop',
          demoBuilder: ColorDemo.new,
        ),
        AnimationExampleData(
          title: 'Color Example 2',
          subtitle: 'Teal to orange variation',
          demoBuilder: _buildColorAlt,
        ),
      ],
    ),
    const AnimationTileData(
      title: 'Hero Animation',
      subtitle: '2 examples',
      icon: Icons.flight,
      examples: [
        AnimationExampleData(
          title: 'Hero Example 1',
          subtitle: 'Auto hero-style flight loop',
          demoBuilder: HeroDemo.new,
        ),
        AnimationExampleData(
          title: 'Hero Example 2',
          subtitle: 'Auto star flight loop',
          demoBuilder: _buildHeroAlt,
        ),
      ],
    ),
    const AnimationTileData(
      title: 'Staggered Animation',
      subtitle: '2 examples',
      icon: Icons.auto_awesome,
      examples: [
        AnimationExampleData(
          title: 'Staggered Example 1',
          subtitle: 'Default staggered sequence',
          demoBuilder: StaggeredDemo.new,
        ),
        AnimationExampleData(
          title: 'Staggered Example 2',
          subtitle: 'Longer timeline with sparkle icon',
          demoBuilder: _buildStaggeredAlt,
        ),
      ],
    ),
  ];
}

Widget _buildFadeAlt() {
  return const FadeDemo(
    minOpacity: 0.05,
    duration: Duration(milliseconds: 1200),
  );
}

Widget _buildScaleAlt() {
  return const ScaleDemo(
    startScale: 0.7,
    endScale: 2.0,
    duration: Duration(milliseconds: 650),
  );
}

Widget _buildRotationAlt() {
  return const RotationDemo(duration: Duration(milliseconds: 900));
}

Widget _buildSlideAlt() {
  return const SlideDemo(
    endOffset: Offset(1.0, -0.5),
    duration: Duration(milliseconds: 700),
  );
}

Widget _buildSizeAlt() {
  return const SizeDemo(
    smallSize: 70,
    largeSize: 220,
    duration: Duration(milliseconds: 650),
  );
}

Widget _buildColorAlt() {
  return const ColorDemo(
    firstColor: Colors.teal,
    secondColor: Colors.orange,
    duration: Duration(milliseconds: 700),
  );
}

Widget _buildHeroAlt() {
  return const HeroDemo(
    icon: Icons.star,
    duration: Duration(milliseconds: 2100),
  );
}

Widget _buildStaggeredAlt() {
  return const StaggeredDemo(
    duration: Duration(milliseconds: 2000),
    icon: Icons.stars,
  );
}
