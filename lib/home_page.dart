import 'package:flutter/widgets.dart';

import 'exercise.dart';
import 'main_menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final exercises = [Exercise("Plus"), Exercise("Minus")];
    return MainMenu(exercises);
  }
}