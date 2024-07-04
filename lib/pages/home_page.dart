import 'package:flutter/material.dart';
import 'package:quiz_app/random_number.dart';
import 'package:quiz_app/widgets/textWidget.dart';
import 'package:quiz_app/widgets/verticalSpace.dart';

import '../widgets/horizontalSpace.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? num1;
  int? num2;
  int? answer;
  int questions = 1;
  int wrong = 0;
  int right = 0;
  int points = 0;
  List<int>? options = [0, 0, 0, 0];
  bool isLoading = true;
  bool flag = false;
  getRandomNumbers() {
    num1 = RandomNumService.getNumber();
    num2 = RandomNumService.getNumber();
    answer = num1! + num2!;

    int rightAnswerPosition = RandomNumService.getOptionPosition();
    int optionPosition = RandomNumService.getOptionPosition();
    while (optionPosition == rightAnswerPosition) {
      optionPosition = RandomNumService.getOptionPosition();
    }
    options?[optionPosition] = answer! + 10;
    options?[rightAnswerPosition] = answer!;
    for (int i = 0; i < 4; i++) {
      if (i == rightAnswerPosition || i == optionPosition) {
        continue;
      } else {
        int option = RandomNumService.getNumberBasedOnAnswer(answer);
        for (int j = 0; j < 4; j++) {
          if (option == options?[j]) {
            flag = true;
          }
        }
        if (flag) {
          flag = false;
          i = i - 1;
          continue;
        } else {
          options?[i] = option;
        }
      }
    }
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getRandomNumbers();
  }

  checkAnswer(int val) {
    if (questions != 15) {
      if (val == answer) {
        right = right + 1;
        points = points + 5;
      } else {
        wrong = wrong + 1;
      }
      questions = questions + 1;
      getRandomNumbers();
    } else {
      if (val == answer) {
        right = right + 1;
        points = points + 5;
      } else {
        wrong = wrong + 1;
      }
      Navigator.pushReplacementNamed(context, "result-page",
          arguments: {"questions": (questions), "answer": right});
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Colors.orange,
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width * 0.92,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 20,
                              )
                            ]),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${questions}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.orange),
                                  ),
                                  TextWidget(text: "Questions"),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${points}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.orange),
                                  ),
                                  TextWidget(text: "Points"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${right}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.green),
                                  ),
                                  TextWidget(text: "Correct"),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${wrong}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.red),
                                  ),
                                  TextWidget(text: "Wrong"),
                                ],
                              ),
                            ],
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
                VerticalSpacing(40),
                TextWidget(
                  text: "Q.${questions} What is the answer of ${num1}+${num2}?",
                ),
                VerticalSpacing(30),
                Padding(
                  padding: const EdgeInsets.only(left: 47),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: "A)",
                      ),
                      HorizontalSpacing(20),
                      ElevatedButton(
                        onPressed: () {
                          checkAnswer(options![0]);
                        },
                        child: TextWidget(text: options?[0].toString()),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ],
                  ),
                ),
                VerticalSpacing(12),
                Padding(
                  padding: const EdgeInsets.only(left: 47),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: "B)",
                      ),
                      HorizontalSpacing(20),
                      ElevatedButton(
                        onPressed: () {
                          checkAnswer(options![1]);
                        },
                        child: TextWidget(text: options?[1].toString()),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ],
                  ),
                ),
                VerticalSpacing(12),
                Padding(
                  padding: const EdgeInsets.only(left: 47),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: "C)",
                      ),
                      HorizontalSpacing(20),
                      ElevatedButton(
                        onPressed: () {
                          checkAnswer(options![2]);
                        },
                        child: TextWidget(text: options?[2].toString()),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ],
                  ),
                ),
                VerticalSpacing(12),
                Padding(
                  padding: const EdgeInsets.only(left: 47),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: "D)",
                      ),
                      HorizontalSpacing(20),
                      ElevatedButton(
                        onPressed: () {
                          checkAnswer(options![3]);
                        },
                        child: TextWidget(text: options?[3].toString()),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
    );
  }
}
