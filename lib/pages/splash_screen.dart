import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "home-page");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.orange.withOpacity(0.4),
        child: Center(
          child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(300)),
            child: Image.asset(
              "assets/images/logo.jpg",
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
