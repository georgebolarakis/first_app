import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      //we add a column to add two items in there
      body: Column(
        children: <Widget>[
          //we are adding two areas
          //the first
          Card(
            //we wrap the text in a container to be able to add more configuration to it
            child: Container(
              color: Colors.blue,
              //width: 100,
              //to take the full length of the screen
              width: double.infinity,
              child: Text("Chart"),
            ),
            //make the card look a bit better, a card is text inside a really small box
            //elevation brings it a bit forward with a bit more shadow
            elevation: 5,
          ),
          //The second area
          Container(
            width: double.infinity,
            child: Card(
              child: Text("List of transaction"),
            ),
          ),
        ],
      ),
    );
  }
}
