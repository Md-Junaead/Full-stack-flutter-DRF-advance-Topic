import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// ১. এটি হলো LeafRenderObjectWidget (যার কোনো Child নেই)
class CustomBoxWidget extends LeafRenderObjectWidget {
  final Color color;
  final Size size;

  const CustomBoxWidget({
    super.key,
    required this.color,
    required this.size,
  });

  @important
  @override
  RenderCustomBox createRenderObject(BuildContext context) {
    // RenderObject তৈরি করা হচ্ছে
    return RenderCustomBox(color: color, boxSize: size);
  }

  @override
  void updateRenderObject(BuildContext context, RenderCustomBox renderObject) {
    // ডাটা পরিবর্তন হলে RenderObject আপডেট করা হচ্ছে
    renderObject
      ..color = color
      ..boxSize = size;
  }
}

// ২. আসল RenderObject ক্লাস যা লেআউট এবং পেইন্ট সামলায়
class RenderCustomBox extends RenderBox {
  Color _color;
  Size _boxSize;

  RenderCustomBox({required Color color, required Size boxSize})
      : _color = color,
        _boxSize = boxSize;

  set color(Color value) {
    if (_color == value) return;
    _color = value;
    markNeedsPaint(); // আবার রং করার জন্য রিকোয়েস্ট
  }

  set boxSize(Size value) {
    if (_boxSize == value) return;
    _boxSize = value;
    markNeedsLayout(); // সাইজ বদলালে আবার লেআউটের জন্য রিকোয়েস্ট
  }

  // কাস্টম লেআউট হিসাব
  @override
  void performLayout() {
    size = constraints.constrain(_boxSize);
  }

  // আসল পিক্সেল ড্র করার মেথড
  @override
  void paint(PaintingContext context, Offset offset) {
    final Paint paint = Paint()..color = _color;
    // স্ক্রিনে রেকট্যাঙ্গেল আঁকা হচ্ছে
    context.canvas.drawRect(offset & size, paint);
  }
}