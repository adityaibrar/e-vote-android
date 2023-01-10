import 'dart:convert';

import 'package:android_vote/constant/api.dart';
import 'package:android_vote/constant/theme_shared.dart';
import 'package:android_vote/controller/list_calon_detail.dart';
import 'package:android_vote/model/user.dart';
import 'package:android_vote/services/share_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CalonDetaiView extends StatefulWidget {
  final Map? item;
  const CalonDetaiView({Key? key, required this.item}) : super(key: key);

  Widget build(context, CalonDetailController controller) {
    controller.view = this;

    void dataUser() async {
      var usr = await SharedPrefs().getUser();
      User user = User.fromJson(json.decode(usr));

      var uri = Uri.parse(AppUrl.vote);
      Map data = {
        'id_user': user.idUser,
        'id_calon': "${item!["id_calon"]}",
      };

      var response = await http.post(uri, body: data);
      var datas = await json.decode(response.body);

      if (datas['code'] == 200) {
        Get.defaultDialog(
          title: 'Berhasil',
          content: Text(
            "Terima kasih pemilihan anda berhasil disimpan",
            style: fieldTextStyle.copyWith(color: blackColor),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.offAllNamed('/home');
              },
              style: TextButton.styleFrom(backgroundColor: primaryColor),
              child: Text(
                "OK",
                style: fieldTextStyle.copyWith(color: whiteColor),
              ),
            ),
          ],
        );
      } else if (datas['code'] == 401) {
        Get.defaultDialog(
          title: 'Pemilihan Gagal!!!',
          content: Text(
            "Anda sudah pernah memilih! 1 Akun hanya dapat menginput pemilihan sebanyak 1 Kali",
            style: fieldTextStyle.copyWith(color: blackColor),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.offAllNamed('/home');
              },
              style: TextButton.styleFrom(backgroundColor: redColor),
              child: Text(
                "OK",
                style: fieldTextStyle.copyWith(color: whiteColor),
              ),
            ),
          ],
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${item!["nama_calon"]}"),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          height: 850,
          color: whiteColor,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Image.network(
                  "http://e-vote.wstif3a-bws.id//assets/foto_calon/${item!["gambar"]}"),
              Card(
                color: primaryColor,
                child: Html(
                  data: "${item!["visimisi"]}",
                  style: {
                    "p": Style(
                      color: whiteColor,
                    )
                  },
                ),
              ),
              ElevatedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green[800]!,
                ),
                onPressed: () {
                  dataUser();
                },
                child: Text(
                  "VOTE",
                  style: fieldTextStyle.copyWith(color: whiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<CalonDetaiView> createState() => CalonDetailController();
}
