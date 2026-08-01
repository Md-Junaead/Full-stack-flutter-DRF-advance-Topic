import 'package:flutter/material.dart';

class OptimizedImageWidget extends StatelessWidget {
  const OptimizedImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/large_banner.png',
      // MEMORY OPTIMIZATION: Decode image at exact display size instead of full original 4K resolution
      cacheWidth: 300,
      cacheHeight: 200,
      fit: BoxFit.cover,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          child: child,
        );
      },
    );
  }
}