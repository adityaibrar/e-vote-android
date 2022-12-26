import 'package:flutter/material.dart';

class Rules extends StatefulWidget {
  const Rules({super.key});

  @override
  State<Rules> createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              child: Image.asset("assets/images/tata_cara.png"),
            )
          ],),),
    );
  }
}