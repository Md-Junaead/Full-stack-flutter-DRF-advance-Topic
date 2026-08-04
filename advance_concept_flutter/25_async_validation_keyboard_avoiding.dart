// 25_async_validation_keyboard_avoiding.dart
import 'package:flutter/material.dart';

class AsyncValidationForm extends StatelessWidget {
  const AsyncValidationForm({super.key});

  Future<bool> _checkUsernameUnique(String username) async {
    await Future.delayed(const Duration(seconds: 1)); // API call simulation
    return username != "admin";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Auto adjustment for keyboard
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Username'),
              validator: (val) {
                if (val == null || val.isEmpty) return 'Username required';
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}