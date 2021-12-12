enum Operation {
  PLUS,
  MINUS,
  MULTIPLICATION,
  DIVISION,
}

class Question {
  final int num1;
  final int num2;
  final Operation operation;
  final int result;
  final String operationLabel;

  Question(this.num1, this.num2, this.operation)
      : result = _calculate(num1, num2, operation),
        operationLabel = label(operation);

  static int _calculate(int num1, int num2, Operation operation) {
    switch (operation) {
      case Operation.PLUS:
        return num1 + num2;
      case Operation.MINUS:
        return num1 - num2;
      case Operation.MULTIPLICATION:
        return num1 * num2;
      case Operation.DIVISION:
        return num1 ~/ num2;
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
      case Operation.DIVISION:
        return '/';
      default:
        throw Error;
    }
  }
}
