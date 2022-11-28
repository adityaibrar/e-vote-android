import 'package:android_vote/views/widgets/list_calon.dart';
import 'package:flutter/material.dart';
import 'package:android_vote/constant/theme_shared.dart';

class DashBoard extends StatefulWidget {
  static String route = '/home';
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with TickerProviderStateMixin {
  late TabController _controller;

  final List<Tab> topTabs = <Tab>[
    new Tab(text: 'Tata Cara'),
    new Tab(text: 'Voting'),
    new Tab(text: 'Hasil Sementara'),
  ];

  @override
  void initState() {
    super.initState();

    _controller = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: primaryColor,
          body: SingleChildScrollView(
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
                              "Hallo, User",
                              style: tittleTextStyle.copyWith(
                                  fontSize: 20, color: secondaryColor),
                            ),
                            Spacer(),
                            // MaterialButton(
                            //   onPressed: () {
                            //     //kalo ditekan menampilkan dropdown untuk logout
                            //   },
                            //   child: Icon(
                            //     Icons.menu,
                            //     color: secondaryColor,
                            //   ),
                            // )
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.menu,
                                size: 30,
                                color: secondaryColor,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pilihlah sesuai dengan keyekinan anda agar tidak kecewa dikemudian hari",
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
                    height: 600,
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
                            child: Column(
                              children: [
                                Text(
                                  "SISA WAKTU PEMILIHAN",
                                  style: subtittleTextStyle.copyWith(
                                      color: whiteColor),
                                ),
                              ],
                            ),
                            height: 100,
                            width: width,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  16.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
                            children: const [
                              Center(
                                child: Text("Voting"),
                              ),
                              ListCalonView(),
                              Center(
                                child: Text("Hasil Sementara"),
                              )
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
