import 'package:flutter/widgets.dart';

import 'exercise.dart';
import 'main_menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final exercises = [
      Exercise("+"),
      Exercise("-"),
      Exercise("*"),
      Exercise(":")
    ];
    return MainMenu(exercises);
  }
}
