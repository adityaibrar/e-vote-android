import 'package:android_vote/constant/theme_shared.dart';
import 'package:android_vote/controller/list_calon_detail.dart';
import 'package:android_vote/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class CalonDetaiView extends StatefulWidget {
  final Map? item;
  const CalonDetaiView({Key? key, required this.item}) : super(key: key);

  Widget build(context, CalonDetailController controller) {
    final argument = ModalRoute.of(context)!.settings.arguments as GetArg;

    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("${item!["nama_calon"]}"),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
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
                  //button untuk vote @rayhan
                  print("${item!["id_calon"]}");
                  // print("${argument.id}");
                  Get.snackbar('Ooppsss', 'Masih On Proggress',
                      colorText: redColor, backgroundColor: whiteColor);
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
