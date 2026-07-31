import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider.autoDispose<int>((ref) {
  // autoDispose explicitly cleans state when no listeners exist
  return 0;
});

final persistentDataProvider = FutureProvider.autoDispose<String>((ref) async {
  // Keep alive dynamically based on business logic
  final link = ref.keepAlive(); 
  
  // Auto-dispose after 5 minutes of inactivity
  ref.onDispose(() {
    print('Cleaned up resources');
  });

  await Future.delayed(const Duration(seconds: 2));
  return 'Critical Cached Data';
});

// UI Listening Example
class RefListenExampleWidget extends ConsumerWidget {
  const RefListenExampleWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen for side-effects like showing SnackBar
    ref.listen<int>(counterProvider, (previous, next) {
      if (next == 10) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Goal Reached!')),
        );
      }
    });

    return ElevatedButton(
      onPressed: () => ref.read(counterProvider.notifier).state++,
      child: const Text('Increment'),
    );
  }
}