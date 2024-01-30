import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/src/constants/colors.dart';
import 'package:calculator/src/constants/spacing.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color color;
  final bool isBigger;
  final void Function(String?) onPressed;

  const CustomButton.numberPad({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = ColorPalette.kNumberPadButton,
    this.isBigger = false,
  });

  const CustomButton.basicOperation({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = ColorPalette.kBasicOperationButton,
    this.isBigger = false,
  });

  const CustomButton.specificOperation({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = ColorPalette.kSpecificOperationButton,
    this.isBigger = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isBigger ? 2 : 1,
      child: ElevatedButton(
        onPressed: () => onPressed(text),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            side: BorderSide(
              color: ColorPalette.kBorder,
              width: 0.2,
            ),
            borderRadius: BorderRadius.all(Radius.zero),
          )),
        ),
        child: AutoSizeText(
          '$text',
          minFontSize: FontSize.minButton,
          maxFontSize: FontSize.maxButton,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ColorPalette.kTextPrimary,
            fontSize: FontSize.maxButton,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
