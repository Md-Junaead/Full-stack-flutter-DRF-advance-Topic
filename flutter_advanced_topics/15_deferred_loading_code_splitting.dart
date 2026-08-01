import 'package:flutter/material.dart';
// Deferred import splits the bundle file
import 'package:flutter/material.dart' deferred as heavy_feature;

class DeferredLoadingScreen extends StatefulWidget {
  const DeferredLoadingScreen({super.key});

  @override
  State<DeferredLoadingScreen> createState() => _DeferredLoadingScreenState();
}

class _DeferredLoadingScreenState extends State<DeferredLoadingScreen> {
  late Future<void> _libraryLoader;

  @override
  void initState() {
    super.initState();
    // Load code bundle on demand
    _libraryLoader = heavy_feature.loadLibrary();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _libraryLoader,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const Text('ডিফার্ড লোডেড মডিউল রেডি!');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}