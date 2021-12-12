import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NumberButton extends StatelessWidget {
  final String value;
  final TextStyle style;
  final Color color;
  final Color textColor;

  NumberButton(this.value,
      {this.style, this.color = Colors.white, this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      child: Text('$value',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 30.0,
          )),
      shape: CircleBorder(),
      elevation: 2.0,
      color: color,
      textColor: textColor,
      padding: EdgeInsets.all(15.0),
    );
  }
}
