// File Name: 01_widget_element_render_tree.dart
import 'package:flutter/material.dart';

/// Real-world system: Optimized Feed Item Component
/// Key concept: Widget is immutable blueprint, Element keeps state & binds RenderObject.
class FeedCardWidget extends StatefulWidget {
  final String postId;
  final String postContent;

  const FeedCardWidget({
    super.key,
    required this.postId,
    required this.postContent,
  });

  @override
  State<FeedCardWidget> createState() => _FeedCardWidgetState();
}

class _FeedCardWidgetState extends State<FeedCardWidget> {
  bool isLiked = false;

  void toggleLike() {
    // Calling setState marks the corresponding Element as 'dirty'.
    // Element tree does NOT destroy RenderObject; it only updates properties.
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    // context HERE IS THE Element itself! (Element implements BuildContext)
    debugPrint("Element ID/Hash: ${context.hashCode}");
    
    return Card(
      child: ListTile(
        title: Text(widget.postContent),
        trailing: IconButton(
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? Colors.red : Colors.grey,
          ),
          onPressed: toggleLike,
        ),
      ),
    );
  }
}