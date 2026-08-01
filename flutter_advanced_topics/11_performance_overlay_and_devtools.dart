import 'package:flutter/material.dart';

class PerformanceOverlayExample extends StatelessWidget {
  const PerformanceOverlayExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Enable Performance Overlay for identifying UI/GPU Jank in Profile Mode
      showPerformanceOverlay: true,
      checkerboardOffscreenLayers: true, // Highlights improper raster caching
      home: Scaffold(
        appBar: AppBar(title: const Text('Performance Profiling')),
        body: ListView.builder(
          itemCount: 1000,
          itemBuilder: (context, index) {
            // Smooth rendering item
            return ListTile(
              title: Text('Smooth Item #$index'),
            );
          },
        ),
      ),
    );
  }
}