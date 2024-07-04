import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/verticalSpace.dart';

class ResultPage extends StatelessWidget {
  int? questions;
  int? answer;
  int? score;
  getScore(args) {
    questions = args["questions"];
    answer = args["answer"];
    double scoreInDouble = (answer! * 100 / questions!);
    score = scoreInDouble.toInt();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    getScore(args);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.orange,
        child: Center(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width * 0.92,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(children: [
            Image.asset(
              score! >= 50 ? 'assets/images/win.jpg' : 'assets/images/lost.png',
              height: 200,
            ),
            VerticalSpacing(15),
            Text(
              "${score!}% Score",
              style: TextStyle(
                  fontSize: 45,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            VerticalSpacing(15),
            Text("Quiz Completed Successfully",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            VerticalSpacing(15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: RichText(
                text: TextSpan(
                    text: "You attempt",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                          text: " ${questions!} questionss",
                          style: TextStyle(color: Colors.blue, fontSize: 18)),
                      TextSpan(text: " and from that "),
                      TextSpan(
                          text: " ${answer!} answer",
                          style: TextStyle(color: Colors.green, fontSize: 18)),
                      TextSpan(text: " is correct.")
                    ]),
              ),
            ),
            VerticalSpacing(25),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "home-page");
              },
              child: Text(
                "Play again",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 18)),
            ),
          ]),
        )),
      ),
    );
  }
}
