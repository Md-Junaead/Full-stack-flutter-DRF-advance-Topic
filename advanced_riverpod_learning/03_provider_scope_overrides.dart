import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ApiService {
  String fetchData();
}

class RealApiService implements ApiService {
  @override
  String fetchData() => 'Live Production Data';
}

class FakeApiService implements ApiService {
  @override
  String fetchData() => 'Mock Test Data';
}

final apiServiceProvider = Provider<ApiService>((ref) => RealApiService());

void main() {
  runApp(
    ProviderScope(
      overrides: [
        // Override RealApiService with FakeApiService for testing or staging
        apiServiceProvider.overrideWithValue(FakeApiService()),
      ],
      child: const MaterialApp(home: ScopedOverrideScreen()),
    ),
  );
}

class ScopedOverrideScreen extends ConsumerWidget {
  const ScopedOverrideScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(apiServiceProvider).fetchData();
    return Scaffold(body: Center(child: Text(data)));
  }
}