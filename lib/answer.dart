import 'package:flutter/material.dart';
import 'main.dart';
class Answer extends StatelessWidget {
  final String _answerText;
  final Function _answerPressed;

  Answer(this._answerText,
      this._answerPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: fieldsTheme,
        textColor: w,
        onPressed: _answerPressed,
        child: Text(
          _answerText,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
