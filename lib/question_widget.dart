import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matematik/question.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final TextStyle style;

  QuestionWidget(this.question, {this.style});

  final ButtonStyle numberStyle = ElevatedButton.styleFrom(
      shape: StadiumBorder(),
      primary: Colors.orange,
      textStyle: const TextStyle(fontSize: 20));

  final ButtonStyle operatorStyle = ElevatedButton.styleFrom(
      primary: Colors.orange, textStyle: const TextStyle(fontSize: 20));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            child: ElevatedButton(
                style: numberStyle, child: Text('${question.num1}'))),
        Container(
            alignment: Alignment.center,
            child: ElevatedButton(
                style: operatorStyle,
                child: Text('${question.operationLabel}'))),
        Container(
            alignment: Alignment.center,
            child: ElevatedButton(
                style: numberStyle, child: Text('${question.num2}'))),
      ],
    )));
  }
}
