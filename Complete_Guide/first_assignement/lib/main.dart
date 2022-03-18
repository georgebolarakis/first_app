//create a new app and output an AppBar and some text
//add a button which changes the text
//split the app into three widgets: App, TextControl & text

import 'package:flutter/material.dart';
import './text_control.dart';

//we are running our app here
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  //the two arguments that the build method takes
  Widget build(BuildContext context) {
    //we are returning a materialApp that does all the core work
    return MaterialApp(
      //home screen
      home: Scaffold(
        //adding a bar
        appBar: AppBar(
          title: Text("Assignement 1"),
        ),
        //adding the body
        body: TextControl(),
      ),
    );
  }
}
