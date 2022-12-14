import 'dart:convert';

import 'package:android_vote/constant/api.dart';
import 'package:android_vote/model/user.dart';
import 'package:android_vote/services/share_prefs.dart';
import 'package:android_vote/views/screen/closed_event.dart';
import 'package:android_vote/views/screen/tata_cara.dart';
import 'package:android_vote/views/widgets/list_calon.dart';
import 'package:android_vote/views/widgets/pooling.dart';
import 'package:flutter/material.dart';
import 'package:android_vote/constant/theme_shared.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DashBoard extends StatefulWidget {
  static String route = '/home';

  const DashBoard({super.key});
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with TickerProviderStateMixin {
  late TabController _controller;

  final List<Tab> topTabs = <Tab>[
    const Tab(text: 'Tata Cara'),
    const Tab(text: 'Voting'),
    const Tab(text: 'Hasil Sementara'),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 3);
    checkTime();
  }

  void doLogout() async {
    var usr = await SharedPrefs().removeUser();
  }

  bool isSameTime = false;

  checkTime() async {
    var uri = Uri.parse(AppUrl.date);
    var respons =
        await http.get(uri, headers: {'Content-Type': 'Application/json'});
    final Map<String, dynamic> datajson = json.decode(respons.body);
    var tanggal = datajson['data_date']['waktu'];

    DateTime now = DateTime.now();
    String formatter = DateFormat('yyyy-MM-dd').format(now);
    if (tanggal == formatter) {
      setState(() {
        isSameTime = true;
      });
    } else {
      setState(() {
        isSameTime = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as GetArg;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: primaryColor,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: ScrollController(),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin, vertical: defaultMargin),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Hallo, ${argument.nama} ",
                              style: tittleTextStyle.copyWith(
                                  fontSize: 15, color: secondaryColor),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Get.defaultDialog(
                                    title: "Log Out dari Aplikasi E-VOTE?",
                                    content: const Text(
                                        "Tekan tombol YA jika anda yakin akan keluar dari Aplikasi E-VOTE...\n\nTekan tombol TIDAK jika anda ingin kembali ke Aplikasi E-VOTE..."),
                                    actions: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: primaryColor),
                                        onPressed: () {
                                          doLogout();
                                          Get.offAllNamed('/login');
                                        },
                                        child: Text(
                                          "YA",
                                          style: fieldTextStyle.copyWith(
                                              color: whiteColor),
                                        ),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          "TIDAK",
                                          style: fieldTextStyle.copyWith(
                                              color: whiteColor),
                                        ),
                                      ),
                                    ]);
                              },
                              child: Icon(
                                Icons.person,
                                size: 30,
                                color: secondaryColor,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kepemimpinan bukanlah tentang pemilihan berikutnya, Tapi ini tentang generasi berikutnya.",
                                style: subtittleTextStyle.copyWith(
                                  color: secondaryColor,
                                  fontSize: 15,
                                  height: 1,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TabBar(
                                controller: _controller,
                                indicator: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                unselectedLabelColor: primaryColor,
                                labelColor: secondaryColor,
                                tabs: const [
                                  Tab(text: "Tata Cara"),
                                  Tab(
                                    text: "Voting",
                                  ),
                                  Tab(
                                    text: "Hasil Sementara",
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: TabBarView(
                            controller: _controller,
                            children: [
                              const Rules(),
                              isSameTime
                                  ? const ListCalonView()
                                  : const ClosedEvent(),
                              isSameTime
                                  ? const PoolingView()
                                  : const ClosedEvent(),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
