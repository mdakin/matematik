import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matematik/question.dart';

import 'choice.dart';

enum State { waitingAnswer, correct, incorrect }

class QuestionWidget extends StatelessWidget {
  final Question question;
  final TextStyle style;
  State state = State.waitingAnswer;
  Choice<int> currentChoice;

  QuestionWidget(this.question, {this.style});

  bool answeredCorrectly = false;

  final ButtonStyle numberStyle = ElevatedButton.styleFrom(
      shape: StadiumBorder(),
      primary: Colors.orange,
      textStyle: const TextStyle(fontSize: 50));

  final ButtonStyle operatorStyle = ElevatedButton.styleFrom(
      primary: Colors.blueAccent, textStyle: const TextStyle(fontSize: 25));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Container(
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: renderedQuestion())),
            Container(
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: renderedChoices())),
          ])),
    );
  }

  List<Widget> renderedChoices() {
    return [for (var choice in question.choices) draggableChoice(choice)];
  }

  Widget draggableChoice(Choice choice) => Draggable<Choice>(
      child: renderChoice(choice),
      childWhenDragging: renderEmptyChoice(choice),
      feedback: renderDraggingChoice(choice),
      data: choice);

  Widget renderChoice(Choice<int> choice) => Container(
      decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
      width: 60,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text(
        '${choice.value}',
        style: TextStyle(fontSize: 50, color: Colors.white),
      ));

  Widget renderDraggingChoice(Choice<int> choice) => Container(
      decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
      width: 70,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text(
        '${choice.value}',
        style: TextStyle(
            decoration: TextDecoration.none, fontSize: 50, color: Colors.white),
      ));

  Widget renderEmptyChoice(Choice<int> choice) => Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
          width: 3.0,
        ),
      ),
      width: 60,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text(
        '${choice.value}',
        style: TextStyle(fontSize: 50, color: Colors.white),
      ));

  List<Widget> renderedQuestion() => [
        Container(
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            width: 60,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(
              '${question.num1}',
              style: TextStyle(fontSize: 50, color: Colors.white),
            )),
        Container(
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent, shape: BoxShape.circle),
            width: 40,
            height: 50,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(
              '${question.operationLabel}',
              style: TextStyle(fontSize: 35, color: Colors.white),
            )),
        Container(
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            width: 60,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(
              '${question.num2}',
              style: TextStyle(fontSize: 50, color: Colors.white),
            )),
        Container(
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent, shape: BoxShape.circle),
            width: 40,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(
              '=',
              style: TextStyle(fontSize: 35, color: Colors.white),
            )),
        DragTarget<Choice<int>>(onAccept: (choice) {
          currentChoice = choice;
          if (choice.value == question.result) {
            state = State.correct;
          } else {
            state = State.incorrect;
          }
        }, builder: (context, candidates, rejects) {
          if (candidates.length > 0) {
            return renderAnswer(choice: currentChoice);
          }
          return renderAnswer();
        }),
      ];

  Widget renderAnswer({Choice choice}) {
    switch (state) {
      case State.correct:
        return answerCorrect(currentChoice);
      case State.incorrect:
        return answerIncorrect(currentChoice);
      default:
        return answerBoxWaiting;
    }
  }

  Widget answerCorrect(Choice<int> choice) => Container(
      decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
      width: 60,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text(
        '${choice.value}',
        style: TextStyle(fontSize: 50, color: Colors.white),
      ));

  Widget answerIncorrect(Choice<int> choice) => Container(
      decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
      width: 60,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text(
        '${choice.value}',
        style: TextStyle(fontSize: 50, color: Colors.white),
      ));

  Widget answerBoxWaiting = Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.green,
          width: 3.0,
        ),
      ),
      width: 60,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text(
        '',
        style: TextStyle(fontSize: 50, color: Colors.white),
      ));

  Widget answerBoxAccepting = Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.green,
          width: 3.0,
        ),
      ),
      width: 75,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text(
        '',
        style: TextStyle(fontSize: 50, color: Colors.white),
      ));

}
