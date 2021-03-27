import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final Function _restartQuiz;
  final int _totalScore;

  String get resultPhrase {
    String resultText;
    if (_totalScore >= 70 && _totalScore <= 100) {
      resultText = 'A';
    } else if (_totalScore > 100 && _totalScore <= 130) {
      resultText = 'B';
    } else if (_totalScore > 130 && _totalScore <= 150) {
      resultText = 'C';
    } else if (_totalScore > 150 && _totalScore <= 170) {
      resultText = 'D';
    }
    return resultText;
  }

  Result(this._restartQuiz, this._totalScore);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Done! your score is: $_totalScore so your category is: $resultPhrase',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              color: textTheme,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        FlatButton(
          color: fieldsTheme,
          onPressed: _restartQuiz,
          child: Text(
            'Restart the App',
            style: TextStyle(
              color: textTheme,
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }
}
