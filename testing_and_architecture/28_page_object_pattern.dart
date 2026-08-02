import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Page Object Abstraction for Login Screen
class LoginPageObject {
  final WidgetTester tester;
  LoginPageObject(this.tester);

  final finderEmail = find.byKey(const Key('email_input'));
  final finderSubmit = find.byKey(const Key('submit_btn'));

  Future<void> enterEmail(String email) async {
    await tester.enterText(finderEmail, email);
  }

  Future<void> tapSubmit() async {
    await tester.tap(finderSubmit);
    await tester.pumpAndSettle();
  }
}