import 'package:bh_sequencial/mob/State/mob_state.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class Graf3 extends StatelessWidget {
  Graf3({Key? key}) : super(key: key);
  final Mob_State mob = GetIt.I<Mob_State>();
  int index = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Tempo')),
        primaryYAxis: NumericAxis(title: AxisTitle(text: 'mm')),
        // Chart title
        title: ChartTitle(
            text:
                'Capacidade de Armazenamento (CAD),\nArmazenamento (ARM) mensal'),
        // Enable legend
        legend: Legend(
            isVisible: true,
            orientation: LegendItemOrientation.horizontal,
            position: LegendPosition.bottom),

        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<dynamic, String>>[
          LineSeries<dynamic, String>(
            dataSource: mob.Lista_data_clima_media.cast<dynamic>(),
            xValueMapper: (dynamic sales, _) {
              if (index < mob.Lista_data_clima_media.length - 1) {
                index++;
              } else {
                index = 0;
              }

              return mob.Lista_data_clima_media[index].mes +
                  '/' +
                  mob.Lista_data_clima_media[index].ano;
            },
            yValueMapper: (dynamic sales, _) {
              return double.parse(mob.cad);
            },
            name: 'CAD',
            width: 2,
            // color: Colors.red,
            dataLabelSettings: DataLabelSettings(isVisible: false),
          ),
          LineSeries<dynamic, String>(
            dataSource: mob.Lista_data_clima_media.cast<dynamic>(),
            xValueMapper: (dynamic sales, _) {
              if (index < mob.Lista_data_clima_media.length - 1) {
                index++;
              } else {
                index = 0;
              }

              return mob.Lista_data_clima_media[index].mes +
                  '/' +
                  mob.Lista_data_clima_media[index].ano;
            },
            yValueMapper: (dynamic sales, _) {
              return mob.Lista_data_clima_media[index].arm;
            },
            name: 'ARM',
            width: 2,
            color: Colors.green,
            dataLabelSettings: DataLabelSettings(isVisible: false),
          ),
        ],
      ),
    );
  }
}
