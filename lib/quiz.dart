import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final Function _answerForQuestions;
  final String _question;
  final List<Map<String, Object>> _answers;
  static final List<Map<String, Object>> questionsAndAnswers = [
    {
      'question': 'What\'s your favorite color 1?',
      'answers': [
        {'text': 'red', 'score': 10},
        {'text': 'green', 'score': 30},
        {'text': 'yellow', 'score': 20},
        {'text': 'black', 'score': 40},
      ],
    },
    {
      'question': 'What\'s your favorite color 2?',
      'answers': [
        {'text': 'green', 'score': 30},
        {'text': 'yellow', 'score': 20},
        {'text': 'red', 'score': 10},
        {'text': 'white', 'score': 40},
      ],
    },
    {
      'question': 'What\'s your favorite color 3?',
      'answers': [
        {'text': 'yellow', 'score': 20},
        {'text': 'green', 'score': 30},
        {'text': 'red', 'score': 10},
        {'text': 'white', 'score': 40},
      ],
    },
    {
      'question': 'What\'s your favorite color 4?',
      'answers': [
        {'text': 'black', 'score': 40},
        {'text': 'blue', 'score': 50},
        {'text': 'purple', 'score': 50},
        {'text': 'pink', 'score': 50},
      ],
    },
  ];

  Quiz(this._question, this._answerForQuestions, this._answers);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          _question,
        ),
        ...(_answers)
            .map((answer) => Answer(
                answer['text'], () => _answerForQuestions(answer['score'])))
            .toList(),
      ],
    );
  }
}
