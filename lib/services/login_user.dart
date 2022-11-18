import 'dart:convert';
import 'package:android_vote/constant/api.dart';
import 'package:android_vote/model/user.dart';
import 'package:http/http.dart' as http;

class UserServices {
  late Result _user;

  // static Future login({
  //   required String username,
  //   required String password,
  // }) async {
  //   // Uri UrlApi = Uri.parse(AppUrl.user);
  //   var uri = Uri.parse(AppUrl.user);

  //   // final response = await http.post(UrlApi,);

  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //   };
  //   var body = jsonEncode({
  //     'username': username,
  //     'password': password,
  //   });

  //   try {
  //     var response = await http.post(
  //       uri,
  //       headers: headers,
  //       body: body,
  //     );

  //     return response;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  Future UserVote() async {}

  Future Logout() async {}
}
