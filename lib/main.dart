import 'package:flutter/material.dart';
import 'package:matematik/exercise.dart';
import 'package:matematik/main_menu.dart';
import 'package:matematik/question.dart';
import 'package:matematik/question_widget.dart';
import 'package:matematik/route_generator.dart';

// This is the entry point of Flutter application.
// The application is also a widget, and runApp  basically fills the screen
// With give widget.
void main() => runApp(MyApp());

// Main application is a stateless widget,
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matematik',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

