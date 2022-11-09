import 'package:android_vote/constant/theme_shared.dart';
import 'package:android_vote/model/calon.dart';
import 'package:android_vote/services/calonServices.dart';
import 'package:flutter/material.dart';

class listview extends StatefulWidget {
  const listview({super.key});

  @override
  State<listview> createState() => _listviewState();
}

class _listviewState extends State<listview> {
  late Future data;

  List<Candidate> data2 = [];

  @override
  void initState() {
    data = CandidateServices().getCandidate();
    data.then((value) => {
          setState(() {
            data2 = value;
          })
        });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data2.length == null
          ? Center(
              child: CircularProgressIndicator(color: primaryColor),
            )
          // : ListView.builder(
          //     itemCount: data2.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         title: Text(
          //           data2[index].namaCalon,
          //           style: tittleTextStyle.copyWith(color: whiteColor),
          //         ),
          //       );
          //     },
          //   ),
          : ListView.builder(
              itemCount: data2.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 500,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        
                        Text(
                          data2[index].namaCalon,
                          style: tittleTextStyle.copyWith(
                              fontSize: 12, color: whiteColor),
                        ),
                        Text(data2[index].kelas),
                        Text(data2[index].jurusan),
                        Text(data2[index].visi),
                        Text(data2[index].misi),
                        Text(data2[index].visi),
                      ],
                      // child: ListTile(
                      //   title: Text(
                      //     data2[index].namaCalon,
                      //     style: tittleTextStyle.copyWith(
                      //         color: whiteColor, fontSize: 30),
                      //   ),
                      //   subtitle: const Text(
                      //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "),
                      // ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
