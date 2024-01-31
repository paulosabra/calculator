import 'package:calculator/src/components/display_panel.dart';
import 'package:calculator/src/components/keyboard.dart';
import 'package:calculator/src/models/memory.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final Memory memory = Memory();

  _onPressed(String? command) {
    setState(() {
      memory.applyCommand(command ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomDisplayPanel(value: memory.value),
          CustomKeyboard(
            onPressed: _onPressed,
          ),
        ],
      ),
    );
  }
}
