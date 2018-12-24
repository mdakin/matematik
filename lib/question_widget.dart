
import 'package:flutter/widgets.dart';
import 'package:matematik/question.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final TextStyle style;

  QuestionWidget(this.question, {this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('${question.num1}', textAlign: TextAlign.center, style: style),
        Text('${question.operationLabel}', textAlign: TextAlign.center, style: style),
        Text('${question.num2}', textAlign: TextAlign.center, style: style),
      ],
    );
  }

}