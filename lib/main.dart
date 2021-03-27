import 'package:flutter/material.dart';
import 'result.dart';
import 'quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Color w = Colors.white,
    g = Colors.grey,
    bla = Colors.black,
    blu = Colors.blue,
    theme,
  // appBarTheme,
    textTheme,
    fieldsTheme;

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0,
      _totalScore = 0,
      _num0 = 0,
      _num1 = 0,
      _num2 = 0,
      _num3 = 0;

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _num0 = 0;
      _num1 = 0;
      _num2 = 0;
      _num3 = 0;
    });
  }

  void _answerQuestion(int score) {
    if (_questionIndex == 0)
      _num0 = score;
    else if (_questionIndex == 1)
      _num1 = score;
    else if (_questionIndex == 2)
      _num2 = score;
    else if (_questionIndex == 3) _num3 = score;

    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  void _returnToPrevious() {
    if (_questionIndex == 0) {
      _num0 = 0;
    } else if (_questionIndex == 1) {
      _totalScore -= _num0;
      _num0 = 0;
    } else if (_questionIndex == 2) {
      _totalScore -= _num1;
      _num1 = 0;
    } else if (_questionIndex == 3) {
      _totalScore -= _num2;
      _num2 = 0;
    } else if (_questionIndex == 4) {
      _totalScore -= _num3;
      _num3 = 0;
    }

    setState(() {
      if (_questionIndex > 0) _questionIndex--;
    });
  }

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: fieldsTheme,
          title: Text(
            'Quiz App',
            style: TextStyle(
              color: w,
            ),
          ),
          actions: <Widget>[
            Switch(
              value: isSwitched,
              onChanged: (val) => setState(() {
                isSwitched = val;
                theme = isSwitched ? g : w;
                textTheme = isSwitched ? w : bla;
                fieldsTheme = isSwitched ? bla : blu;
              }),
              activeTrackColor: w,
              activeColor: blu,
              inactiveTrackColor: bla,
              inactiveThumbColor: g,
            ),
          ],
        ),
        body: Container(
          color: theme,
          child: _questionIndex < Quiz.questionsAndAnswers.length
              ? Quiz(
                  Quiz.questionsAndAnswers[_questionIndex]['question'],
                  _answerQuestion,
                  Quiz.questionsAndAnswers[_questionIndex]['answers'],
                )
              : Result(_restartQuiz, _totalScore),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _returnToPrevious,
          backgroundColor: fieldsTheme,
          child: Icon(
            Icons.arrow_back,
            color: w,
          ),
        ),
      ),
    );
  }
}
