import 'package:android_vote/model/calon.dart';
import 'package:android_vote/services/calon_services.dart';
import 'package:android_vote/views/widgets/pooling.dart';
import 'package:flutter/material.dart';

class PollingController extends State<PoolingView> {
  static late PollingController instance;
  late PoolingView view;

  @override
  void initState() {
    instance = this;
    loadCalon();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List<DataCalon> CalonList = [];

  loadCalon() async {
    Map obj = await CandidateServices.getCandidate();
    List items = obj["data"];
    for (var i = 0; i < items.length; i++) {
      var item = items[i];
      CalonList.add(
        DataCalon(
          namaCalon: item["nama_calon"],
          jumlahVote: double.parse("${item["jumlah_vote"]}"),
        ),
      );
    }
    print(CalonList);
    if (mounted) {
      setState(() {});
    }
  }
}
