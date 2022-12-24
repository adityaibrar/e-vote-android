import 'package:android_vote/services/calon_services.dart';
import 'package:android_vote/views/widgets/list_calon.dart';
import 'package:flutter/material.dart';

class ListCalonController extends State<ListCalonView> {
  static late ListCalonController instance;
  late ListCalonView view;
  bool visible = false;

  @override
  void initState() {
    instance = this;
    Future.delayed(const Duration(milliseconds: 900), () {
      visible = true;
      setState(() {});
    });
    loadCalon();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List calonList = [];

  loadCalon() async {
    Map obj = await CandidateServices.getCandidate();
    calonList = obj["data"];
    setState(() {});
  }
}
