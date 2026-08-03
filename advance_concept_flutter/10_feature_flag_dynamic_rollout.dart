// File: 10_feature_flag_dynamic_rollout.dart
import 'package:flutter/material.dart';

class FeatureFlagService {
  // বাস্তব প্রজেক্টে এটি Firebase Remote Config বা Backend API থেকে আসবে
  static final Map<String, bool> _flags = {
    'enable_new_checkout_ui': true,
    'enable_ai_recommendation': false,
  };

  static bool isFeatureEnabled(String flagKey) {
    return _flags[flagKey] ?? false;
  }
}

class DynamicCheckoutScreen extends StatelessWidget {
  const DynamicCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isNewUi = FeatureFlagService.isFeatureEnabled('enable_new_checkout_ui');

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Center(
        child: isNewUi
            ? ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('New Modern One-Click Pay UI'),
              )
            : ElevatedButton(
                onPressed: () {},
                child: const Text('Legacy Multi-Step Checkout'),
              ),
      ),
    );
  }
}