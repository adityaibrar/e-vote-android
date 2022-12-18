import 'dart:convert';

import 'package:android_vote/constant/api.dart';
import "package:http/http.dart" as http;

class VoteServices {
  static Future<Map> getTanggal() async{
    Uri urlApi = Uri.parse(AppUrl.calon);
    var response = await http.get(
      urlApi,
      headers: {
        "Content-Type": "application/json",
      },
    );
    Map obj = jsonDecode(response.body);
    return obj;
  } 
}