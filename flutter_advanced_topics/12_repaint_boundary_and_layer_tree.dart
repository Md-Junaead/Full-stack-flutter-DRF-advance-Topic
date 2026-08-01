import 'package:flutter/material.dart';

class RepaintBoundaryOptimizationWidget extends StatelessWidget {
  const RepaintBoundaryOptimizationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Complex Static Background Component
          const Positioned.fill(
            child: Placeholder(), // Imagine an expensive vector graphic
          ),
          // Isolated Repaint Layer for Heavy Animations
          Positioned(
            top: 100,
            left: 100,
            child: RepaintBoundary(
              // Isolates the repainting of this subtree from the parent canvas layer tree
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}