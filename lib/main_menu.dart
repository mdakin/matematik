import 'package:flutter/material.dart';
import 'package:matematik/exercise.dart';
import 'package:matematik/simple_arithmetic_question.dart';

class MainMenu extends StatelessWidget {
  final List<Exercise> exercises;

  MainMenu(this.exercises);

  final ButtonStyle style = ElevatedButton.styleFrom(
      primary: Colors.orange, textStyle: const TextStyle(fontSize: 20));

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Matematik'),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300.0,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 2.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal,
                child: ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SimpleArithmeticQuestion()));
                  },
                  child: Text('${exercises[index].name}'),
                ),
              );
            },
            childCount: exercises.length,
          ),
        ),
      ],
    );
  }
}
