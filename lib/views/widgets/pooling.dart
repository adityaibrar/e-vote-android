import 'package:android_vote/model/calon.dart';
import 'package:flutter/material.dart';
import 'package:android_vote/controller/pooling.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PoolingView extends StatefulWidget {
  const PoolingView({Key? key}) : super(key: key);

  Widget build(context, PollingController controller) {
    controller.view = this;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SfCircularChart(
              legend: Legend(
                isVisible: true,
              ),
              series: <PieSeries<DataCalon, String?>>[
                PieSeries<DataCalon, String?>(
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                    ),
                    dataSource: controller.CalonList,
                    // pointColorMapper: (DataCalon data, _) => colorList,
                    xValueMapper: (DataCalon data, _) => data.namaCalon,
                    yValueMapper: (DataCalon data, _) => data.jumlahVote),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<PoolingView> createState() => PollingController();
}
