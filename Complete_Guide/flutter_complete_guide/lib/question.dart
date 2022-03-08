import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  //final means that this property will never change
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      //.infinity the container takes as much width as it can get on the screen
      width: double.infinity,
      //margin is spacing around the container
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
