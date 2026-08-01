import 'package:flutter/material.dart';

class OptimizedRebuildWidget extends StatefulWidget {
  const OptimizedRebuildWidget({super.key});

  @override
  State<OptimizedRebuildWidget> createState() => _OptimizedRebuildWidgetState();
}

class _OptimizedRebuildWidgetState extends State<OptimizedRebuildWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => setState(() => _counter++),
          child: Text('Count: $_counter'),
        ),
        // CONST: Will NEVER rebuild when parent setState runs
        const HeavyStaticWidget(),
        // ValueKey ensures widget state preservation during re-ordering
        DynamicItemWidget(key: ValueKey(_counter)),
      ],
    );
  }
}

class HeavyStaticWidget extends StatelessWidget {
  const HeavyStaticWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('আমি কখনোই রি-বিল্ড হব না');
  }
}

class DynamicItemWidget extends StatelessWidget {
  const DynamicItemWidget({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}