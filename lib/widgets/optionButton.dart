import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/horizontalSpace.dart';
import 'package:quiz_app/widgets/textWidget.dart';

class OptionButton extends StatelessWidget {
  String? value;
  String? optionNumber;
  VoidCallback? callback;
  OptionButton({this.value, this.optionNumber, this.callback});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          text: optionNumber!,
        ),
        HorizontalSpacing(10),
        ElevatedButton(
          onPressed: () {
            callback!();
          },
          child: TextWidget(text: value!),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        )
      ],
    );
  }
}
