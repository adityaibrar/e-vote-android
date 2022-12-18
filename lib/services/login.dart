import 'dart:convert';

import 'package:android_vote/constant/theme_shared.dart';
import 'package:android_vote/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:android_vote/constant/api.dart';

class Getexten extends GetxController {
  LogIn(String username, String password) async {
    var uri = Uri.parse(AppUrl.user);
    Map data = {
      'username': username,
      'password': password,
    };

    var respons = await http.post(uri, body: data);
    var datas = jsonEncode(jsonDecode(respons.body));
    final Map<String, dynamic> datajson = json.decode(respons.body);
    // print(respons.body);

    if (datas.contains('Succes')) {
      Get.defaultDialog(
          title: "Login Succesfully",
          content: const Text("Berhasil Login"),
          actions: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: primaryColor),
              onPressed: () {
                // Get.toNamed('/home',
                //     arguments: datajson['data_user'][0]['nama']);
                Get.toNamed('/home',
                    arguments: GetArg(datajson['data_user'][0]['id_user'],
                        datajson['data_user'][0]['nama']));
              },
              child: Text(
                "OK",
                style: fieldTextStyle.copyWith(color: whiteColor),
              ),
            ),
          ]);
    } else if (datas.contains('Password_salah')) {
      Get.defaultDialog(
        title: "Login Tidak berhasil",
        content: Container(
          child: Text(
              "Silahkan cek kembali username dan password yang anda masukkan"),
        ),
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
    } else if (datas.contains('Data tidak ditemukan, lanjutkan registrasi?')) {
      Get.defaultDialog(
        title: "Username dan Password yang anda masukkan tidak valid",
        content: Container(
          child: Text(
              "Silahkan cek kembali username dan password yang anda masukkan"),
        ),
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
