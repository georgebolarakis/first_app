import 'package:flutter/material.dart';
import './text_output.dart';

class TextControl extends StatefulWidget {
  @override
  State<TextControl> createState() => _TextControlState();
}

class _TextControlState extends State<TextControl> {
  String _mainText = "This is the first app!";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          //on pressed argument where we pass a reference to a function
          onPressed: () {
            //to rebuild the UI
            setState(() {
              _mainText = "this Changed";
            });
          },
          child: Text("Change Text"),
        ),
        TextOutput(_mainText)
      ],
    );
  }
}
