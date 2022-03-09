import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget {
  //we need to store the data
  final String mainText;
  //to receive data we need a constructor
  TextOutput(this.mainText);

  //this is the build method
  @override
  Widget build(BuildContext context) {
    return Text(mainText);
  }
}
