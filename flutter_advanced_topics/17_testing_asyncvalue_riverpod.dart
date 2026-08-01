import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataProvider = FutureProvider.autoDispose<String>((ref) async {
  return 'Real Data';
});

void main() {
  test('Verify AsyncValue states transitions', () async {
    final container = ProviderContainer(
      overrides: [
        dataProvider.overrideWith((ref) => Future.value('Test Data')),
      ],
    );
    addTearDown(container.dispose);

    // Initial state check - AsyncLoading or AsyncData
    final asyncVal = container.read(dataProvider);
    expect(asyncVal, isA<AsyncValue<String>>());

    // Wait for the future to resolve
    final data = await container.read(dataProvider.future);
    expect(data, 'Test Data');
  });
}