import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountMutationController extends AutoDisposeAsyncNotifier<void> {
  @override
  Future<void> build() async {
    // Initial state is idle (AsyncData with null/void)
  }

  Future<void> deleteAccount(String userId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      // Perform mutation operation
      await Future.delayed(const Duration(seconds: 2));
      print('Account $userId deleted successfully');
    });
  }
}

final accountMutationProvider =
    AsyncNotifierProvider.autoDispose<AccountMutationController, void>(
  () => AccountMutationController(),
);