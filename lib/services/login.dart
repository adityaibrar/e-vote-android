import 'dart:convert';

import 'package:android_vote/constant/theme_shared.dart';
import 'package:android_vote/model/user.dart';
import 'package:android_vote/services/share_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:android_vote/constant/api.dart';

class Getexten extends GetxController {
  logIn(String username, String password) async {
    var uri = Uri.parse(AppUrl.user);
    Map data = {
      'username': username,
      'password': password,
    };

    var respons = await http.post(uri, body: data);
    final Map<String, dynamic> datajson = json.decode(respons.body);
    var coba = await json.decode(respons.body);

    if (coba['code'] == 200) {
      User user = User.fromJson(coba['user']);
      await SharedPrefs().storeUser(json.encode(user));
      Get.defaultDialog(
          title: "Login Succesfully",
          content: const Text("Berhasil Login"),
          actions: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: primaryColor),
              onPressed: () {
                Get.toNamed('/home',
                    arguments: GetArg(
                        datajson['user']['id_user'], datajson['user']['nama']));
              },
              child: Text(
                "OK",
                style: fieldTextStyle.copyWith(color: whiteColor),
              ),
            ),
          ]);
      // return datas.contains;
      // } else if (datas.contains('Password_salah')) {
    } else if (coba['code'] == 401) {
      Get.defaultDialog(
        title: "Login Tidak berhasil",
        content: const Text(
            "Silahkan cek kembali username dan password yang anda masukkan"),
        actions: [
          TextButton(
            style: TextButton.styleFrom(backgroundColor: primaryColor),
            child: Text(
              "OK",
              style: fieldTextStyle.copyWith(color: whiteColor),
            ),
            onPressed: () => Get.back(),
          ),
        ],
      );
      // } else if (datas.contains('Data tidak ditemukan, lanjutkan registrasi?')) {
    } else if (coba['code'] == 404) {
      Get.defaultDialog(
        title: "Username dan Password yang anda masukkan tidak valid",
        content: const Text(
            "Silahkan cek kembali username dan password yang anda masukkan"),
        actions: [
          TextButton(
            style: TextButton.styleFrom(backgroundColor: primaryColor),
            child: Text(
              "OK",
              style: fieldTextStyle.copyWith(color: whiteColor),
            ),
            onPressed: () => Get.back(),
          ),
        ],
      );
    }
  }
}
