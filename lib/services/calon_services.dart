import 'dart:convert';

import 'package:android_vote/constant/api.dart';
import "package:http/http.dart" as http;

class CandidateServices {
  static Future<Map> getCandidate() async {
    Uri UrlApi = Uri.parse(AppUrl.calon);
    var response = await http.get(
      UrlApi,
      headers: {
        "Content-Type": "application/json",
      },
    );
    Map obj = jsonDecode(response.body);
    return obj;
  }
}
