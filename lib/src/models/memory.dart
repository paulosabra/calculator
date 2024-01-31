import 'package:calculator/src/constants/button_texts.dart';

class Memory {
  static const basicOperations = [
    ButtonText.percent,
    ButtonText.divide,
    ButtonText.multiply,
    ButtonText.minus,
    ButtonText.addition,
    ButtonText.equals,
  ];

  String _value = '0';
  String? _lastCommand;
  String? _operation;

  final _buffer = [0.0, 0.0];
  int _index = 0;

  bool _wipeValue = false;

  String get value {
    return _value;
  }

  void applyCommand(String command) {
    if (_isReplacingOperation(command)) {
      _operation = command;
      return;
    }

    if (command == ButtonText.allClear) {
      _onAllClearPressed();
    } else if (command == ButtonText.clear) {
      _onClearPressed();
    } else if (basicOperations.contains(command)) {
      _onBasicOperationPressed(command);
    } else {
      _onDigitPressed(command);
    }

    _lastCommand = command;
  }

  bool _isReplacingOperation(String command) {
    return basicOperations.contains(_lastCommand) &&
        basicOperations.contains(command) &&
        _lastCommand != ButtonText.equals &&
        command != ButtonText.equals;
  }

  _onAllClearPressed() {
    _wipeValue = false;
    _index = 0;
    _buffer.setAll(
      (0),
      [0.0, 0.0],
    );
    _operation = null;

    _value = '0';
  }

  _onClearPressed() {
    _value = _value.substring(0, _value.length - 1);
  }

  _onDigitPressed(String command) {
    final isDecimal = command == ButtonText.decimalPoint;
    final wipeValue = (_value == '0' && !isDecimal) || _wipeValue;

    if (isDecimal && _value.contains(ButtonText.decimalPoint) && !wipeValue) {
      return;
    }

    final emptyValue = isDecimal ? '0' : '';
    final currentValue = wipeValue ? emptyValue : _value;
    _value = currentValue + command;
    _wipeValue = false;

    _buffer[_index] = double.tryParse(_value) ?? 0;
  }

  _onBasicOperationPressed(String operation) {
    bool isEqualsPressed = operation == ButtonText.equals;
    if (_index == 0) {
      if (!isEqualsPressed) {
        _operation = operation;
        _index = 1;
      }

      if (operation == ButtonText.percent) {
        _calculate(isEqualsPressed, operation);
      }
    } else {
      _calculate(isEqualsPressed, operation);
    }
    _wipeValue = !isEqualsPressed;
  }

  void _calculate(bool isEqualsPressed, String operation) {
    _buffer[0] = _doMath();
    _buffer[1] = 0.0;
    _value = _buffer[0].toString();
    _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;

    _operation = isEqualsPressed ? null : operation;
    _index = isEqualsPressed ? 0 : 1;
  }

  _doMath() {
    switch (_operation) {
      case ButtonText.percent:
        _buffer[1] = 100;
        return _buffer[0] / _buffer[1];
      case ButtonText.divide:
        return _buffer[0] / _buffer[1];
      case ButtonText.multiply:
        return _buffer[0] * _buffer[1];
      case ButtonText.minus:
        return _buffer[0] - _buffer[1];
      case ButtonText.addition:
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }
}
