import 'package:android_vote/views/screen/SplashScreen.dart';
import 'package:android_vote/views/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:android_vote/constant/theme_shared.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Splashscreen(),
        '/home': (context) => DashBoard(),
      },
      // home: Splashscreen(),
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: Colors.transparent,
      ),
    );
  }
}
