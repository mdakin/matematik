import 'package:flutter/widgets.dart';
import 'package:matematik/question.dart';
import 'package:matematik/question_widget.dart';

class SimpleArithmeticQuestion extends StatelessWidget {
  final Question question = Question(3, 5, Operation.PLUS);

  @override
  Widget build(BuildContext context) {
    return QuestionWidget(question);
  }
}
