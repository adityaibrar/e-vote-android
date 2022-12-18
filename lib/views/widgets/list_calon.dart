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
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = controller.CalonList[index];
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 900),
                  margin: EdgeInsets.only(top: controller.visible ? 0 : 100),
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 900),
                    scale: controller.visible ? 1.0 : 0.0,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 900),
                      opacity: controller.visible ? 1.0 : 0.0,
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
                                  Image.network(
                                      "http://10.0.2.2/e-voting/assets/foto_calon/${item["gambar"]}"),
                                  Text(
                                    "${item["nama_calon"]}",
                                    style: tittleTextStyle.copyWith(
                                        fontSize: 12, color: whiteColor),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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
