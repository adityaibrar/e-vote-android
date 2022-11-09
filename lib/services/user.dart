import 'dart:convert';

import 'package:android_vote/constant/api.dart';
import "package:http/http.dart" as http;

class User {
  static Future getUser() async {
    var response = await http.get(
    Uri.parse(AppUrl.user),
    headers: {
    "Content-Type": "application/json",
    },
    );
    Map obj = jsonDecode(response.body);
  }
}