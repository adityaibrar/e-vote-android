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
      // print(user.idUser);

      var uri = Uri.parse(AppUrl.vote);
      Map data = {
        'id_user': user.idUser,
        'id_calon': "${item!["id_calon"]}",
      };

      var response = await http.post(uri, body: data);
      var datas = await json.decode(response.body);

      if (datas['code'] == 200) {
        Get.snackbar("Success", datas['message'],);
      } else if (datas['code'] == 401) {
        Get.snackbar("Gagal", datas['message']);
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
          // height: MediaQuery.of(context).size.height,
          color: whiteColor,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Image.network(
                  "http://10.0.2.2/e-voting/assets/foto_calon/${item!["gambar"]}"),
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
