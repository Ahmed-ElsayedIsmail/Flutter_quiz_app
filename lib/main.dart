import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print("question answerd !");
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionsText': 'What\'s your favorite color?',
        'answers': ['Black', 'Blue', 'Green', 'White'],
      },
      {
        'questionsText': 'What\'s your favorite animal?',
        'answers': ['Lion', 'Rabbit', 'Elephant', 'Snake'],
      },
      {
        'questionsText': '"What\'s your favorite club?"',
        'answers': ['Juve', 'Arsenal', 'ManCity', 'Leeds'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Quiz'),
        ),
        body: Column(
          children: [
            Questions(
              questions[_questionIndex]['questionsText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
