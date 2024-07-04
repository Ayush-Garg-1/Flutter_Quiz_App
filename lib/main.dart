import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/result_page.dart';
import 'package:quiz_app/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        "home-page": (context) => HomePage(),
        "result-page": (context) => ResultPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
