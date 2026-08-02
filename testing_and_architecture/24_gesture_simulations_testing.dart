import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Simulate Dismissible Swipe Gesture Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListView(
            children: [
              Dismissible(
                key: const Key('item_1'),
                child: const ListTile(title: Text('Swipe Me Away')),
              ),
            ],
          ),
        ),
      ),
    );

    // Simulate Left Swipe Gesture
    await tester.drag(find.byKey(const Key('item_1')), const Offset(-500.0, 0.0));
    await tester.pumpAndSettle();

    // Verify item is removed after gesture animation
    expect(find.text('Swipe Me Away'), findsNothing);
  });
}