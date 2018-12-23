
import 'package:flutter/widgets.dart';

enum Operation {
  PLUS,
  MINUS,
  MULTIPLICATION
}

class Question extends StatelessWidget {
  final int num1;
  final int num2;
  final Operation operation;
  final int result;
  final String operationLabel;
  final TextStyle style;

  Question(this.num1, this.num2, this.operation, {this.style}) :
    result = _calculate(num1, num2, operation),
    operationLabel = label(operation);

  static int _calculate(int num1, int num2, Operation operation) {
    switch (operation) {
      case Operation.PLUS:
        return num1 + num2;
      case Operation.MINUS:
        return num1 - num2;
      case Operation.MULTIPLICATION:
        return num1 * num2;
      default:
        throw Error;
    }
  }

  static String label(Operation operation) {
    switch (operation) {
      case Operation.PLUS:
        return '+';
      case Operation.MINUS:
        return '-';
      case Operation.MULTIPLICATION:
        return '*';
      default:
        throw Error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
       Text('$num1', textAlign: TextAlign.center, style: style),
       Text('$operationLabel', textAlign: TextAlign.center, style: style),
       Text('$num2', textAlign: TextAlign.center, style: style),
      ],
    );
  }

}