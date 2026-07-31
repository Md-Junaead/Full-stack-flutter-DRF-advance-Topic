// File Name: 05_gesture_arena_hit_testing.dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Real-world system: E-signature / Drawing pad inside a Vertical ScrollView
/// Prevents GestureArena conflicts by explicitly declaring arena victory.
class GestureDisambiguationDemo extends StatelessWidget {
  const GestureDisambiguationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        EagerGestureRecognizer: GestureRecognizerFactoryWithHandlers<EagerGestureRecognizer>(
          () => EagerGestureRecognizer(),
          (EagerGestureRecognizer instance) {
            // EagerGestureRecognizer forcefully claims victory in the GestureArena immediately.
            // Useful for maps or canvases inside nested scrollables.
          },
        ),
      },
      child: Container(
        color: Colors.blueGrey,
        height: 200,
        child: const Center(
          child: Text("Interactive Drawing Canvas (Wins Arena First)"),
        ),
      ),
    );
  }
}