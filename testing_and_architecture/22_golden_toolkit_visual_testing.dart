import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Visual Regression - Button Golden Test', (WidgetTester tester) async {
    // Render target UI component
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Primary Button'),
            ),
          ),
        ),
      ),
    );

    // Match rendered UI canvas frame with saved golden image file
    await expectLater(
      find.byType(ElevatedButton),
      matchesGoldenFile('goldens/primary_button.png'),
    );
  });
}