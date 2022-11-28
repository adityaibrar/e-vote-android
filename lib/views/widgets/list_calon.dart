import 'package:android_vote/constant/theme_shared.dart';
import 'package:android_vote/views/widgets/list_calon_detail.dart';
import 'package:flutter/material.dart';
import '../../controller/list_calon.dart';

class ListCalonView extends StatefulWidget {
  const ListCalonView({Key? key}) : super(key: key);

  Widget build(context, ListCalonController controller) {
    controller.view = this;

    return Scaffold(
      body: controller.CalonList.length == null
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : ListView.builder(
              itemCount: controller.CalonList.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = controller.CalonList[index];
                return Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.green[900],
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CalonDetaiView(
                                        item: item!,
                                      )),
                            );
                          },
                          child: Column(
                            children: [
                              Text(
                                "${item["nama_calon"]}",
                                style: tittleTextStyle.copyWith(
                                    fontSize: 12, color: whiteColor),
                              ),
                              Text(
                                "${item["gambar"]}",
                                style: tittleTextStyle.copyWith(
                                    fontSize: 12, color: whiteColor),
                              ),
                              Text(
                                "${item["jumlah_vote"]}",
                                style: tittleTextStyle.copyWith(
                                    fontSize: 12, color: whiteColor),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  @override
  State<ListCalonView> createState() => ListCalonController();
}
