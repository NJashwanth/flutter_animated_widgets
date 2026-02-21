import 'package:flutter/material.dart';

import '../demos/advanced_animation_demos.dart';
import '../models/animation_tile_data.dart';

List<AnimationTileData> advancedAnimationItems() {
  return [
    const AnimationTileData(
      title: 'Depth Motion',
      subtitle: '3D transforms and layered movement',
      icon: Icons.view_in_ar,
      examples: [
        AnimationExampleData(
          title: 'Glass Cube Rotation',
          subtitle: '3D matrix transform with perspective',
          demoBuilder: GlassCube3dDemo.new,
        ),
        AnimationExampleData(
          title: 'Orbiting Dot Cluster',
          subtitle: 'Multi-point orbit around a center body',
          demoBuilder: OrbitingDotsDemo.new,
        ),
      ],
    ),
    const AnimationTileData(
      title: 'Signal Waves',
      subtitle: 'Procedural paint-based motion lines',
      icon: Icons.graphic_eq,
      examples: [
        AnimationExampleData(
          title: 'Neon Wave Line',
          subtitle: 'Sin wave rendered with CustomPainter',
          demoBuilder: WaveLineDemo.new,
        ),
        AnimationExampleData(
          title: 'Dense Wave Variant',
          subtitle: 'Faster frequency wave motion',
          demoBuilder: _buildWaveAlt,
        ),
      ],
    ),
    const AnimationTileData(
      title: 'Morphing Forms',
      subtitle: 'Shape evolution and organic transforms',
      icon: Icons.change_circle,
      examples: [
        AnimationExampleData(
          title: 'Morphing Blob',
          subtitle: 'Animated radius + rotation composition',
          demoBuilder: MorphingBlobDemo.new,
        ),
        AnimationExampleData(
          title: 'Viscous Blob Variant',
          subtitle: 'Slower, dramatic morph profile',
          demoBuilder: _buildBlobAlt,
        ),
      ],
    ),
    const AnimationTileData(
      title: 'Particle Systems',
      subtitle: 'Field-like animated particles',
      icon: Icons.grain,
      examples: [
        AnimationExampleData(
          title: 'Particle Field',
          subtitle: 'Circular drift particles with depth fade',
          demoBuilder: ParticleFieldDemo.new,
        ),
        AnimationExampleData(
          title: 'Dense Particle Vortex',
          subtitle: 'Higher count and faster flow',
          demoBuilder: _buildParticleAlt,
        ),
      ],
    ),
  ];
}

Widget _buildWaveAlt() {
  return const WaveLineDemo(duration: Duration(milliseconds: 1900));
}

Widget _buildBlobAlt() {
  return const MorphingBlobDemo(duration: Duration(milliseconds: 5600));
}

Widget _buildParticleAlt() {
  return const ParticleFieldDemo(
    duration: Duration(milliseconds: 4200),
    count: 40,
  );
}
