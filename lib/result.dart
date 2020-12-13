import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetFunction;

  Result(this.resultScore, this.resetFunction);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 8) {
      resultText = 'You are awesome.';
    } else if (resultScore <= 10) {
      resultText = 'You are Likeable.';
    } else if (resultScore <= 17) {
      resultText = 'You are ... STRANGE!?.';
    } else {
      resultText = 'You are so bad.';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Column(
          children: [
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text('Restart Quiz!'),
              textColor: Colors.blue,
              onPressed: resetFunction,
            ),
          ],
        ),
      ),
    );
  }
}
