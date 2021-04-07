import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer startTimeout() {
    return Timer(Duration(seconds: 2), changeScreen);
  }

  void changeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            Container(), //TODO: ADD NAVIGATION TO HOME PAGE HERE
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(); //TODO: ADD Splash Screen PAGE Code HERE
  }
}
