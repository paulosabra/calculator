import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/src/constants/colors.dart';
import 'package:calculator/src/constants/spacing.dart';
import 'package:flutter/material.dart';

class CustomDisplayPanel extends StatelessWidget {
  final String? value;

  const CustomDisplayPanel({
    super.key,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: ColorPalette.kDisplayPanelBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(Spacing.s8),
              child: AutoSizeText(
                '$value',
                minFontSize: FontSize.minDisplay,
                maxFontSize: FontSize.maxDisplay,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: ColorPalette.kTextPrimary,
                  fontSize: FontSize.maxDisplay,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
