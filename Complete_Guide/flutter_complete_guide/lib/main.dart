import 'package:flutter/material.dart';
import './question.dart';

void main() {
  runApp(MyApp());
}

//another way to wright the above code, when you just have one argument
//void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//adding a leading underscore defines that the class can be changed only inside this file, turns the class into private
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    // print("answer 1 chosen");
  }

  //adding a decorator to make the code cleaner since we are using out widget instead of the StatelessWidget
  @override
  Widget build(BuildContext context) {
    var questions = [
      "what is your favorite color?",
      "what's your favorite animal?"
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first App"),
        ),
        body: Column(
          children: [
            //question[0]
            Question(questions[_questionIndex]),
            ElevatedButton(
              child: Text("Answer 1"),
              onPressed: _answerQuestion,
            ),
            ElevatedButton(
              child: Text("Answer 2"),
              //here we are calling an anonimous function and we are adding the functionality of a function in it
              onPressed: () => print("answer 2 chosen"),
            ),
            ElevatedButton(
                child: Text("Answer 3"),
                //here we are adding the curly brases to indicate that we have more than one functions running
                onPressed: () {
                  //more things to do
                  print("this is answer 3");
                }),
          ],
        ),
      ),
    );
  }
}
