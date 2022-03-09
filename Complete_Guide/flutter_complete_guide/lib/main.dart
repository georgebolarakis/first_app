import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

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
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {"text": 'Black', "score": 10},
        {"text": 'Red', "score": 5},
        {"text": 'Green', "score": 3},
        {"text": 'White', "score": 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {"text": 'Rabbit', "score": 8},
        {"text": 'Snake', "score": 6},
        {"text": 'Elephant', "score": 4},
        {"text": 'Lion', "score": 2}
      ],
    },
    {
      'questionText': 'What is your favorite vegetable',
      'answers': [
        {"text": 'Tomato', "score": 9},
        {"text": 'Pepper', "score": 7},
        {"text": 'Pizza', "score": 6},
        {"text": 'Pasta', "score": 5}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  //we are reseting them to 0 so we can restart the application on the result.dart file
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
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("we have more questions");
    }

    // print("answer 1 chosen");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        //the question mark marks the border between the condition that is true
        body: _questionIndex < _questions.length
            //we are creating the quiz widget and we are adding the data forwarded to it
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

  //adding a decorator to make the code cleaner since we are using out widget instead of the StatelessWidget
  // @override
  // Widget build(BuildContext context) {
  //   var questions = [
  //     //we create a map either by using {} or by calling the Map() class
  //     //a map is used for more complex data that is a key value pair
  //     {
  //       "questionText: ": "what is your favorite color?",
  //       "answers": ["Black", "red", "green", "white"],
  //     },
  //     {
  //       "questionText: ": "what's your favorite animal?",
  //       "answers": ["dog", "cat", "snake", "rabbit"],
  //     },
  //     {
  //       "questionText: ": "what is your favorite food?",
  //       "answers": ["chilli", "tomato", "lemon", "salami"],
  //     },
  //   ];

  //   return MaterialApp(
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text("My first App"),
  //       ),
  //       body: Column(
  //         children: [
  //           //here we are calling the Question class
  //           //question[0]
  //           Question(
  //             //we are using the key to identify the specific key
  //             questions[_questionIndex]["questionText"],
  //           ),
  //           //the three dots take a list and they pull all the values out and add them to the
  //           //sarounding list as individual values, we are adding essentialy the values
  //           //of the list to a list
  //           ...(questions[_questionIndex]["answers"] as List<String>)
  //               .map((answer) {
  //             return Answer(_answerQuestion, answer);
  //           }).toList()
  //           //calling the buttons from the Answer widget
  //           // Answer(_answerQuestion),
  //           // Answer(_answerQuestion),
  //           // Answer(_answerQuestion),
  //           //using the buttons in the widget
  //           // ElevatedButton(
  //           //   child: Text("Answer 2"),
  //           //   //here we are calling an anonimous function and we are adding the functionality of a function in it
  //           //   onPressed: () => print("answer 2 chosen"),
  //           // ),
  //           // ElevatedButton(
  //           //     child: Text("Answer 3"),
  //           //     //here we are adding the curly brases to indicate that we have more than one functions running
  //           //     onPressed: () {
  //           //       //more things to do
  //           //       print("this is answer 3");
  //           //     }),
  //         ],
  //       ),
  //     ),
  //   );
  // }