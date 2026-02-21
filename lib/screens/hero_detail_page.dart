import 'package:flutter/material.dart';

class HeroDetailPage extends StatelessWidget {
  const HeroDetailPage({
    super.key,
    required this.heroTag,
    required this.icon,
    required this.title,
  });

  final String heroTag;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Hero(
          tag: heroTag,
          child: Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Icon(icon, color: Colors.white, size: 72),
          ),
        ),
      ),
    );
  }
}
