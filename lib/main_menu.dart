import 'package:flutter/material.dart';
import 'package:matematik/excersize.dart';

class MainMenu extends StatelessWidget {

  List<Exercise> excersizes;

  MainMenu(this.excersizes);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Matematik'),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300.0,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 2.0,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text("${excersizes[index].name}",
                  style: TextStyle(fontSize: 15.0, color: Colors.amber),),
              );
            },
            childCount: excersizes.length,
          ),
        ),
      ],
    );
  }
}