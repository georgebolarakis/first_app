import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
//we are adding a property that will take a function value
  final Function selectHandler;

  //we are storing the text to the answerText
  final String answerText;

  //we are making a constractor
  Answer(this.selectHandler, String this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            foregroundColor: MaterialStateProperty.all(Colors.white)),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
