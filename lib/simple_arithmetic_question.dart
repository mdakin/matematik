import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:matematik/question.dart';
import 'package:matematik/question_widget.dart';

import 'choice.dart';

class SimpleArithmeticQuestionSet extends StatefulWidget {
  @override
  State<SimpleArithmeticQuestionSet> createState() =>
      _SimpleArithmeticQuestionSetState();
}

class _SimpleArithmeticQuestionSetState
    extends State<SimpleArithmeticQuestionSet> {
  final random = Random();

  Question currentQuestion;
  List<Question> questions;

  _SimpleArithmeticQuestionSetState() {
    questions = [for (int i = 0; i < 7; i++) generateQuestion()];
    currentQuestion = questions.first;
  }

  Question generateQuestion() {
    int num1 = random.nextInt(20) + 1;
    int num2 = random.nextInt(20) + 1;
    int res = num1 + num2;
    var choices = [Choice(res - 1), Choice(res), Choice(res + 1)];
    choices.shuffle();
    return Question(num1, num2, Operation.PLUS, choices);
  }

  @override
  Widget build(BuildContext context) {
    return QuestionWidget(currentQuestion);
  }
}
