import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  static const _questions = [
    {
      'questionsText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Blue', 'score': 2},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 6}
      ],
    },
    {
      'questionsText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Lion', 'score': 2},
        {'text': 'Rabbit', 'score': 6},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Snake', 'score': 3}
      ],
    },
    {
      'questionsText': 'What\'s your favorite club?',
      'answers': [
        {'text': 'Juve', 'score': 1},
        {'text': 'Arsenal', 'score': 2},
        {'text': 'ManCity', 'score': 5},
        {'text': 'Leeds', 'score': 4}
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
      // print("question answerd !");
    });

    /*if (_questionIndex < _questions.length) {
      print("we have more questions !");
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
