import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String? text;
  TextWidget({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }
}
