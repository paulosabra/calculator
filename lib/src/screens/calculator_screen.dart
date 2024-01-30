import 'package:calculator/src/components/display_panel.dart';
import 'package:calculator/src/components/keyboard.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  _onPressed(String? text) {
    debugPrint(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomDisplayPanel(value: '123.45'),
          CustomKeyboard(
            onPressed: _onPressed,
          ),
        ],
      ),
    );
  }
}
