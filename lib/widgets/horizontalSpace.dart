
import 'package:flutter/material.dart';

class HorizontalSpacing extends StatelessWidget {
  double? space;
  HorizontalSpacing(this.space);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: space,);
  }
}