import 'package:calculator/src/components/button.dart';
import 'package:flutter/material.dart';

class CustomButtonRow extends StatelessWidget {
  final List<CustomButton> buttons;

  const CustomButtonRow({
    super.key,
    required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons,
      ),
    );
  }
}
