// File: 14_shader_masking_agsl.dart
import 'package:flutter/material.dart';

class ShaderMaskExample extends StatelessWidget {
  const ShaderMaskExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [Colors.purple, Colors.orange],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: const Text(
        'Gradient Text via ShaderMask',
        style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}