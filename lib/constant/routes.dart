import 'package:android_vote/views/screen/SplashScreen.dart';
import 'package:android_vote/views/screen/home.dart';
import 'package:android_vote/views/screen/login.dart';

dynamic routes = {
  '/': (context) => const Splashscreen(),
  LoginPage.route: (context) => LoginPage(),
  DashBoard.route: (context) => const DashBoard()
};
