import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plat2/mobx/mob_dados.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graf1 extends StatelessWidget {
  Graf1({Key? key}) : super(key: key);
  final Mob_Dados mob = GetIt.I<Mob_Dados>();
  int index = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Tempo')),
        primaryYAxis: NumericAxis(title: AxisTitle(text: 'mm')),
        // Chart title
        title: ChartTitle(text: 'Balanço Hídrico'),
        // Enable legend
        legend: Legend(
            isVisible: true,
            orientation: LegendItemOrientation.horizontal,
            position: LegendPosition.bottom),

        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<dynamic, String>>[
          AreaSeries<dynamic, String>(
            dataSource: mob.Lista_data_clima_media.cast<dynamic>(),
            xValueMapper: (dynamic sales, _) {
              if (index < mob.Lista_data_clima_media.length - 1) {
                index++;
              } else {
                index = 0;
              }

              return mob.Lista_data_clima_media[index].mes;
            },
            yValueMapper: (dynamic sales, _) {
              return mob.Lista_data_clima_media[index].def * -1;
            },
            name: 'DEF(-1)',
            // width: 5,
            color: Colors.red.withAlpha(150),
            dataLabelSettings: DataLabelSettings(isVisible: false),
          ),
          AreaSeries<dynamic, String>(
            dataSource: mob.Lista_data_clima_media.cast<dynamic>(),
            xValueMapper: (dynamic sales, _) {
              if (index < mob.Lista_data_clima_media.length - 1) {
                index++;
              } else {
                index = 0;
              }

              return mob.Lista_data_clima_media[index].mes;
            },
            yValueMapper: (dynamic sales, _) {
              return mob.Lista_data_clima_media[index].exc;
            },
            name: 'EXC',
            // width: 5,
            color: Colors.blue.withAlpha(150),
            dataLabelSettings: DataLabelSettings(isVisible: false),
          ),
        ],
      ),
    );
  }
}
