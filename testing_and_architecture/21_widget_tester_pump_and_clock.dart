import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('OTP Timer & Animation Pump Testing Example', (WidgetTester tester) async {
    // 1. Build the widget tree
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CircularProgressIndicator(),
        ),
      ),
    );

    // 2. Advance 1 frame (Instant trigger)
    await tester.pump();

    // 3. Fast-forward time by 5 seconds without waiting in real-life
    await tester.pump(const Duration(seconds: 5));

    // 4. Wait for all background animations/futures to fully settle
    await tester.pumpAndSettle();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}