import 'package:flutter/material.dart';
import 'package:matematik/question.dart';

class QuestionSet extends StatelessWidget {
  final List<Question> questions;

  QuestionSet(this.questions);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: drawQuestions(),
    ));
  }

  List<Widget> drawQuestions() =>
      [for (var question in questions) drawQuestion(question)];

  Widget drawQuestion(Question question) => Container(
      decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
      width: 20,
      alignment: Alignment.center,
      child: Text(
        '${question.num1}',
        style: TextStyle(fontSize: 50, color: Colors.white),
      ));
}
