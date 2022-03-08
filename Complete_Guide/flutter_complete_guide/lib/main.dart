import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//another way to wright the above code, when you just have one argument
//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //adding a decorator to make the code cleaner since we are using out widget instead of the StatelessWidget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first App"),
        ),
        body: Text("This is my default text!"),
      ),
    );
  }
}
