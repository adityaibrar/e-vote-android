import 'package:android_vote/constant/theme_shared.dart';
import 'package:android_vote/controller/list_calon_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CalonDetaiView extends StatefulWidget {
  final Map? item;
  const CalonDetaiView({Key? key, required this.item}) : super(key: key);

  Widget build(context, CalonDetailController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("${item!["nama_calon"]}"),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: whiteColor,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset(
                  "C:/laragon/www/e-voting/assets/foto_calon/${item!["gambar"]}"),
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
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  //button untuk vote @rayhan
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
