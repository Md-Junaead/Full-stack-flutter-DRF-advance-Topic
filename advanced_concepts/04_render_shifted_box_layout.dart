// File Name: 04_render_shifted_box_layout.dart
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Real-world system: Custom Badge Positioner Container
class CustomShiftedBadge extends SingleChildRenderObjectWidget {
  final double xOffset;
  final double yOffset;

  const CustomShiftedBadge({
    super.key,
    required Widget child,
    this.xOffset = 12.0,
    this.yOffset = 12.0,
  }) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomShiftedBadge(xOffset, yOffset);
  }

  @override
  void updateRenderObject(BuildContext context, covariant RenderCustomShiftedBadge renderObject) {
    renderObject
      ..xOffset = xOffset
      ..yOffset = yOffset;
  }
}

class RenderCustomShiftedBadge extends RenderShiftedBox {
  double xOffset;
  double yOffset;

  RenderCustomShiftedBadge(this.xOffset, this.yOffset, [RenderBox? child]) : super(child);

  @override
  void performLayout() {
    if (child != null) {
      // 1. Pass constraints down to child
      child!.layout(constraints.loosen(), parentUsesSize: true);

      // 2. Determine size including offsets
      size = constraints.constrain(Size(
        child!.size.width + xOffset,
        child!.size.height + yOffset,
      ));

      // 3. Shift child's position using BoxParentData
      final BoxParentData childParentData = child!.parentData as BoxParentData;
      childParentData.offset = Offset(xOffset, yOffset);
    } else {
      size = constraints.smallest;
    }
  }
}