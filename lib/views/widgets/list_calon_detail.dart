import 'package:android_vote/constant/theme_shared.dart';
import 'package:android_vote/controller/list_calon_detail.dart';
import 'package:flutter/material.dart';

class CalonDetaiView extends StatefulWidget {
  final Map? item;
  const CalonDetaiView({Key? key, required this.item}) : super(key: key);

  Widget build(context, CalonDetailController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: whiteColor,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("Item: $item"),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<CalonDetaiView> createState() => CalonDetailController();
}
