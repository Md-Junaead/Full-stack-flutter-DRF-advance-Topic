// 24_reactive_form_isolation_focus.dart
import 'package:flutter/material.dart';

class IsolatedFormField extends StatelessWidget {
  final ValueNotifier<String?> errorNotifier = ValueNotifier<String?>(null);
  final FocusNode currentFocus;
  final FocusNode? nextFocus;

  IsolatedFormField({super.key, required this.currentFocus, this.nextFocus});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: errorNotifier,
      builder: (context, errorText, child) {
        return TextField(
          focusNode: currentFocus,
          onSubmitted: (_) {
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            }
          },
          decoration: InputDecoration(
            labelText: 'Email',
            errorText: errorText,
          ),
          onChanged: (val) {
            if (val.contains('@')) {
              errorNotifier.value = null;
            } else {
              errorNotifier.value = 'Invalid Email Address';
            }
          },
        );
      },
    );
  }
}