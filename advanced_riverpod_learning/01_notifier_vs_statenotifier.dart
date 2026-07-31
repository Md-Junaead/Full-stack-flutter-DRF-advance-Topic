import 'package:flutter_riverpod/flutter_riverpod.dart';

// LEGACY: StateNotifier Pattern (Old Way)
class OldUserNotifier extends StateNotifier<AsyncValue<String>> {
  OldUserNotifier() : super(const AsyncValue.loading()) {
    fetchUser();
  }

  Future<void> fetchUser() async {
    state = const AsyncValue.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      state = const AsyncValue.data('User: John Doe (Legacy)');
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

// MODERN: AsyncNotifier Pattern (Riverpod 2.0+ Way)
class ModernUserNotifier extends AsyncNotifier<String> {
  @override
  Future<String> build() async {
    // Automatically called on provider initialization
    return _fetchUserFromApi();
  }

  Future<String> _fetchUserFromApi() async {
    await Future.delayed(const Duration(seconds: 1));
    return 'User: Jane Doe (Riverpod 2.0)';
  }

  Future<void> updateName(String newName) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(milliseconds: 500));
      return 'User: $newName';
    });
  }
}

final modernUserProvider = AsyncNotifierProvider<ModernUserNotifier, String>(
  () => ModernUserNotifier(),
);