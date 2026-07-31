import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

void main() {
  test('Unit test Riverpod provider using ProviderContainer', () {
    // 1. Create a ProviderContainer
    final container = ProviderContainer();
    addTearDown(container.dispose);

    // 2. Read initial state
    expect(container.read(counterProvider), 0);

    // 3. Mutate state
    container.read(counterProvider.notifier).state++;

    // 4. Verify updated state
    expect(container.read(counterProvider), 1);
  });
}