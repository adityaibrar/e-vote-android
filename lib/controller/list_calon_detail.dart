import 'package:android_vote/views/widgets/list_calon_detail.dart';
import 'package:flutter/material.dart';

class CalonDetailController extends State<CalonDetaiView> {
  static late CalonDetailController instance;
  late CalonDetaiView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
