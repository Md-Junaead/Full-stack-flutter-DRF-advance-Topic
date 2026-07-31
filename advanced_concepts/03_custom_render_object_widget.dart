// File Name: 03_custom_render_object_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Real-world system: High-performance Custom Visualizer Bar (LeafRenderObject)
class StockBarVisualizer extends LeafRenderObjectWidget {
  final double valuePercent;
  final Color barColor;

  const StockBarVisualizer({
    super.key,
    required this.valuePercent,
    required this.barColor,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderStockBar(valuePercent, barColor);
  }

  @override
  void updateRenderObject(BuildContext context, covariant RenderStockBar renderObject) {
    renderObject
      ..valuePercent = valuePercent
      ..barColor = barColor;
  }
}

class RenderStockBar extends RenderBox {
  double _valuePercent;
  Color _barColor;

  RenderStockBar(this._valuePercent, this._barColor);

  set valuePercent(double val) {
    if (_valuePercent == val) return;
    _valuePercent = val;
    markNeedsPaint(); // Re-paint without re-laying out
  }

  set barColor(Color val) {
    if (_barColor == val) return;
    _barColor = val;
    markNeedsPaint();
  }

  @override
  void performLayout() {
    // Constraints passed down by parent
    size = constraints.constrain(Size(double.infinity, 30.0));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;
    final Paint bgPaint = Paint()..color = Colors.grey.shade300;
    final Paint fillPaint = Paint()..color = _barColor;

    // Draw background
    canvas.drawRect(offset & size, bgPaint);
    
    // Draw filled bar
    final double fillWidth = size.width * _valuePercent;
    canvas.drawRect(offset & Size(fillWidth, size.height), fillPaint);
  }
}