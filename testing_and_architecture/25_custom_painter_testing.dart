import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blue;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 20, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

void main() {
  testWidgets('CustomPainter Canvas Render Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      CustomPaint(
        size: const Size(100, 100),
        painter: CirclePainter(),
      ),
    );

    expect(find.byType(CustomPaint), findsOneWidget);
  });
}