import 'package:flutter/material.dart';

// Abstract Interface boundary exposed by Payment Module
abstract class PaymentFeatureModule {
  Widget getPaymentScreen(double amount);
}

// Independent implementation in payment package
class PaymentFeatureModuleImpl implements PaymentFeatureModule {
  @override
  Widget getPaymentScreen(double amount) {
    return Scaffold(body: Center(child: Text('Pay: \$$amount')));
  }
}