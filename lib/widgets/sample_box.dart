import 'package:flutter/material.dart';

class SampleBox extends StatelessWidget {
  const SampleBox({super.key, this.icon = Icons.star});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, color: Colors.white, size: 40),
    );
  }
}
