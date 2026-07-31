// File Name: 06_dart_generational_gc_optimization.dart
import 'package:flutter/material.dart';

/// Real-world system: Optimized Chat Message List
/// Avoids generating short-lived objects in build() to save Young-Gen GC overhead.
class GCPerformantChatList extends StatelessWidget {
  final List<String> rawMessages;

  // Good Practice: Reusable static/cached instances to prevent Young Gen thrashing
  static const EdgeInsets _itemPadding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
  static const TextStyle _textStyle = TextStyle(fontSize: 14.0, color: Colors.black87);

  const GCPerformantChatList({super.key, required this.rawMessages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rawMessages.length,
      itemBuilder: (context, index) {
        // WRONG FOR GC: Creating new TextStyle(), EdgeInsets() here every frame.
        // CORRECT FOR GC: Reuse immutable static references.
        return Padding(
          padding: _itemPadding,
          child: Text(
            rawMessages[index],
            style: _textStyle,
          ),
        );
      },
    );
  }
}