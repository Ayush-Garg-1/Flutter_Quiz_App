import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget {
  double? space;
  VerticalSpacing(this.space);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space!);
  }
}
