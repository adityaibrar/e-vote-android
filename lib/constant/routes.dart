import 'dart:js';

import 'package:android_vote/views/screen/SplashScreen.dart';
import 'package:android_vote/views/screen/home.dart';
import 'package:android_vote/views/screen/login.dart';

dynamic routes = {
  '/': (context) => Splashscreen(),
  LoginPage.route: (context) => LoginPage(),
  DashBoard.route: (context) => DashBoard()
};
