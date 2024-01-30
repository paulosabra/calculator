import 'package:calculator/src/components/button.dart';
import 'package:calculator/src/components/button_row.dart';
import 'package:calculator/src/constants/button_texts.dart';
import 'package:flutter/material.dart';

class CustomKeyboard extends StatelessWidget {
  final void Function(String?) onPressed;

  const CustomKeyboard({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButtonRow(
            buttons: [
              CustomButton.specificOperation(
                text: ButtonText.allClear,
                onPressed: onPressed,
              ),
              CustomButton.specificOperation(
                text: ButtonText.clear,
                onPressed: onPressed,
              ),
              CustomButton.specificOperation(
                text: ButtonText.percent,
                onPressed: onPressed,
              ),
              CustomButton.basicOperation(
                text: ButtonText.divide,
                onPressed: onPressed,
              ),
            ],
          ),
          CustomButtonRow(
            buttons: [
              CustomButton.numberPad(
                text: ButtonText.number7,
                onPressed: onPressed,
              ),
              CustomButton.numberPad(
                text: ButtonText.number8,
                onPressed: onPressed,
              ),
              CustomButton.numberPad(
                text: ButtonText.number9,
                onPressed: onPressed,
              ),
              CustomButton.basicOperation(
                text: ButtonText.multiply,
                onPressed: onPressed,
              ),
            ],
          ),
          CustomButtonRow(
            buttons: [
              CustomButton.numberPad(
                text: ButtonText.number4,
                onPressed: onPressed,
              ),
              CustomButton.numberPad(
                text: ButtonText.number5,
                onPressed: onPressed,
              ),
              CustomButton.numberPad(
                text: ButtonText.number6,
                onPressed: onPressed,
              ),
              CustomButton.basicOperation(
                text: ButtonText.minus,
                onPressed: onPressed,
              ),
            ],
          ),
          CustomButtonRow(
            buttons: [
              CustomButton.numberPad(
                text: ButtonText.number1,
                onPressed: onPressed,
              ),
              CustomButton.numberPad(
                text: ButtonText.number2,
                onPressed: onPressed,
              ),
              CustomButton.numberPad(
                text: ButtonText.number3,
                onPressed: onPressed,
              ),
              CustomButton.basicOperation(
                text: ButtonText.addition,
                onPressed: onPressed,
              ),
            ],
          ),
          CustomButtonRow(
            buttons: [
              CustomButton.numberPad(
                text: ButtonText.number0,
                isBigger: true,
                onPressed: onPressed,
              ),
              CustomButton.numberPad(
                text: ButtonText.decimalPoint,
                onPressed: onPressed,
              ),
              CustomButton.basicOperation(
                text: ButtonText.equals,
                onPressed: onPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
