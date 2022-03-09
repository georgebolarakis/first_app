import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function resetHandler;
  final int resultScore;
  //our constractor
  Result(this.resultScore, this.resetHandler);

  // getter is a special kind of property that is a property and method at the same time
  String get resultPhrase {
    String resultText;

    if (resultScore <= 8) {
      resultText = "You are awsome and innocent";
    } else if (resultScore <= 12) {
      resultText = "Pretty likebable";
    } else if (resultScore <= 16) {
      resultText = "You are strange";
    } else {
      resultText = "You are so bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text("Restart Quiz"),
            textColor: Colors.blue,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
