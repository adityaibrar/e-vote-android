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
          backgroundColor: Colors.white,
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
                                  fontSize: 15, color: primaryColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
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
                                  color: primaryColor,
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
                      color: primaryColor,
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
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TabBar(
                                controller: _controller,
                                indicator: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                unselectedLabelColor: Colors.white,
                                labelColor: Colors.black,
                                tabs: const [
                                  Tab(text: "Tata Cara"),
                                  Tab(
                                    text: "Voting",
                                  ),
                                  Tab(
                                    text: "Hasil Sementara",
                                  )
                                ]),
                          ),
                          Expanded(
                              child: TabBarView(
                            controller: _controller,
                            children: [
                              ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 500,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      color: Colors.transparent,
                                      child: ListTile(
                                        title: Text(
                                          "Nama Kandidat",
                                          style: tittleTextStyle.copyWith(
                                              color: whiteColor, fontSize: 30),
                                        ),
                                        subtitle: const Text(
                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Center(
                                child: Text("Voting"),
                              ),
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
