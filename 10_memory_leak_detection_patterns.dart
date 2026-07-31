// File Name: 10_memory_leak_detection_patterns.dart
import 'dart:async';
import 'package:flutter/material.dart';

/// Real-world system: Crypto Live Ticker View
/// Demonstrates proper lifecycle disposal to prevent Flutter DevTools memory leaks.
class CryptoTickerScreen extends StatefulWidget {
  const CryptoTickerScreen({super.key});

  @override
  State<CryptoTickerScreen> createState() => _CryptoTickerScreenState();
}

class _CryptoTickerScreenState extends State<CryptoTickerScreen> with SingleTickerProviderStateMixin {
  late StreamSubscription<int> _priceSubscription;
  late AnimationController _animationController;
  
  int currentPrice = 100;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      vsync: this, 
      duration: const Duration(seconds: 1),
    );

    // Continuous event stream simulating price updates
    _priceSubscription = Stream<int>.periodic(
      const Duration(seconds: 1), 
      (i) => 100 + i,
    ).listen((newPrice) {
      if (mounted) {
        setState(() {
          currentPrice = newPrice;
        });
      }
    });
  }

  @override
  void dispose() {
    // CRITICAL: Uncancelled stream subscriptions and un-disposed AnimationControllers
    // keep state objects alive in Heap Memory, causing DevTools Memory Leaks!
    _priceSubscription.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crypto Ticker")),
      body: Center(
        child: Text("Live Price: \$$currentPrice"),
      ),
    );
  }
}