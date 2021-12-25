import 'package:flutter/material.dart';
import 'package:matematik/question.dart';

import 'choice.dart';

enum QuestionState { waitingAnswer, correct, incorrect }

class QuestionWidget extends StatefulWidget {
  final Question question;

  QuestionWidget(this.question);

  @override
  QuestionWidgetState createState() {
    return QuestionWidgetState();
  }
}

class QuestionWidgetState extends State<QuestionWidget> {
  QuestionState questionState = QuestionState.waitingAnswer;
  Choice<int> currentChoice;

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
                margin: EdgeInsets.all(20),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: renderedChoices())),
          ])),
    );
  }

  List<Widget> renderedChoices() {
    return question.choices
        .map((choice) => choice == currentChoice
            ? renderEmptyChoice(choice)
            : draggableChoice(choice))
        .toList();
  }

  Question get question => widget.question;

  Widget draggableChoice(Choice choice) => Draggable<Choice>(
      child: renderChoice(choice),
      childWhenDragging: renderEmptyChoice(choice),
      feedback: renderDraggingChoice(choice),
      data: choice);

  Widget renderChoice(Choice<int> choice) => Container(
      decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text(
        '${choice.value}',
        style: TextStyle(fontSize: 40, color: Colors.white),
      ));

  Widget renderDraggingChoice(Choice<int> choice) => Container(
      decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
      padding: EdgeInsets.all(15),
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
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text(
        '${choice.value}',
        style: TextStyle(fontSize: 40, color: Colors.white),
      ));

  Widget renderQuestion1() => Container(
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: FittedBox(
          child: Text(
        '${question.num1} ${question.operationLabel} ${question.num2} = ',
        style: TextStyle(fontSize: 50, color: Colors.white),
      )));

  List<Widget> renderedQuestion() => [
        renderQuestion1(),
        DragTarget<Choice<int>>(onAccept: (choice) {
          setState(() {
            currentChoice = choice;
            if (choice.value == question.result) {
              questionState = QuestionState.correct;
            } else {
              questionState = QuestionState.incorrect;
            }
          });
        }, builder: (context, candidates, rejects) {
          if (candidates.length > 0) {
            return renderAnswer(choice: currentChoice);
          }
          return renderAnswer();
        }),
      ];

  Widget renderAnswer({Choice choice}) {
    switch (questionState) {
      case QuestionState.correct:
        return answerCorrect(currentChoice);
      case QuestionState.incorrect:
        return answerIncorrect(currentChoice);
      default:
        return answerWaiting;
    }
  }

  Widget answerCorrect(Choice<int> choice) => Container(
      decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text(
        '${choice.value}',
        style: TextStyle(fontSize: 50, color: Colors.white),
      ));

  Widget answerIncorrect(Choice<int> choice) => Container(
      decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text(
        '${choice.value}',
        style: TextStyle(fontSize: 50, color: Colors.white),
      ));

  Widget answerWaiting = Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.green,
          width: 3.0,
        ),
      ),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text(
        '',
        style: TextStyle(fontSize: 50, color: Colors.white),
      ));
}
