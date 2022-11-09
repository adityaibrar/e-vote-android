import 'dart:async';
import 'package:android_vote/views/screen/login.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  @override
  State<Splashscreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO implements initstate
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        this.context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Image.asset(
          "assets/images/splash.png",
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: double.infinity,
        ),
      ),
    );
  }
}
