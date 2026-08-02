import 'package:flutter/material.dart';

class DynamicAssetLoaderWidget extends StatelessWidget {
  const DynamicAssetLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Dynamic asset image loaded lazily via CDN Network rather than bundling into APK
    return Image.network(
      'https://cdn.example.com/assets/heavy_banner.png',
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const CircularProgressIndicator();
      },
    );
  }
}