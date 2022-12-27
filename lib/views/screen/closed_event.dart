import 'package:android_vote/constant/theme_shared.dart';
import 'package:flutter/material.dart';

class ClosedEvent extends StatefulWidget {
  const ClosedEvent({Key? key}) : super(key: key);

  @override
  State<ClosedEvent> createState() => _ClosedEventState();
}

class _ClosedEventState extends State<ClosedEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Flex(
          direction: Axis.vertical,
          children: [
            const SizedBox(
              height: 70.0,
            ),
            Container(
              child: Image.asset("assets/images/closed_event.png"),
            ),
            Center(
              child: Text(
                "event belum tersedia",
                style: tittleTextStyle.copyWith(
                  color: blackColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
