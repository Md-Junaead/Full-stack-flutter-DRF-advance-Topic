// File Name: 02_build_owner_and_pipeline_owner.dart
import 'package:flutter/material.dart';

/// Real-world system: Custom Frame Refresh Engine for High-Performance UI
class EnginePipelineDemo extends StatefulWidget {
  const EnginePipelineDemo({super.key});

  @override
  State<EnginePipelineDemo> createState() => _EnginePipelineDemoState();
}

class _EnginePipelineDemoState extends State<EnginePipelineDemo> {
  
  void triggerManualPipelineUpdate(BuildContext context) {
    // BuildOwner manages dirty elements.
    // context is actually an Element object in Flutter internals.
    final Element currentElement = context as Element;
    
    // Explicitly mark element dirty to schedule rebuild in BuildOwner phase
    currentElement.markNeedsBuild();

    // PipelineOwner manages Layout, Paint, and Compositing stages
    final RenderObject? renderObject = currentElement.findRenderObject();
    if (renderObject != null) {
      // Direct notification to PipelineOwner for re-layout and re-paint
      renderObject.markNeedsLayout();
      renderObject.markNeedsPaint();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => triggerManualPipelineUpdate(context),
      child: const Text("Force Manual Engine Render Pass"),
    );
  }
}