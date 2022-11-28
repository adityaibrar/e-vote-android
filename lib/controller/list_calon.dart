import 'package:android_vote/services/calon_services.dart';
import 'package:android_vote/views/widgets/list_calon.dart';
import 'package:flutter/material.dart';

class ListCalonController extends State<ListCalonView> {
  static late ListCalonController instance;
  late ListCalonView view;

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

  List CalonList = [];

  loadCalon() async {
    Map obj = await CandidateServices.getCandidate();
    CalonList = obj["data"];
    setState(() {});
  }
}
