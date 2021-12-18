import 'package:flutter/widgets.dart';
import 'package:matematik/question.dart';
import 'package:matematik/question_widget.dart';

import 'choice.dart';

class SimpleArithmeticQuestion extends StatelessWidget {
  final Question question =
      Question(3, 5, Operation.PLUS, [Choice(6), Choice(8), Choice(9)]);

  @override
  Widget build(BuildContext context) {
    return QuestionWidget(question);
  }
}
