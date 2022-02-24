import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:plat2/mobx/media_home/mob_media_home.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graf_Media extends StatelessWidget {
  Graf_Media({Key? key}) : super(key: key);
  final Mob_media_home mob_media = GetIt.I<Mob_media_home>();
  @override
  Widget build(BuildContext context) {
    int index = -1;
    return Observer(builder: (_) {
      return Container(
          child: mob_media.isLoad
              ? Container(
                  //color: Colors.amber,
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width / 4,
                  margin: const EdgeInsets.only(bottom: 50),
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 6,
                      color: Color(0xff1E123A),
                    ),
                  ),
                )
              : Container(
                  //color: Colors.red,
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width / 4,
                  margin: const EdgeInsets.only(bottom: 50),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.black26,
                              offset: Offset(1, 2))
                        ],
                      ),
                      child: SfCartesianChart(
                        primaryXAxis:
                            CategoryAxis(title: AxisTitle(text: 'Tempo')),
                        primaryYAxis: NumericAxis(title: AxisTitle(text: 'mm')),
                        // Chart title
                        title: ChartTitle(
                            text: 'Temperatura media dos ultimos dois meses'),
                        // Enable legend
                        legend: Legend(
                            isVisible: true,
                            orientation: LegendItemOrientation.horizontal,
                            position: LegendPosition.bottom),

                        // Enable tooltip
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <ChartSeries<dynamic, String>>[
                          StepAreaSeries<dynamic, String>(
                            dataSource:
                                mob_media.Lista_data_clima.cast<dynamic>(),
                            xValueMapper: (dynamic sales, _) {
                              if (index <
                                  mob_media.Lista_data_clima.length - 1) {
                                index++;
                              } else {
                                index = 0;
                              }

                              return mob_media.Lista_data_clima[index].estado;
                            },
                            yValueMapper: (dynamic sales, _) {
                              return mob_media.Lista_data_clima[index].media;
                            },
                            name: 'Temperatura',
                            // width: 5,
                            color: Color(0xff4E436E),
                            dataLabelSettings:
                                DataLabelSettings(isVisible: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
    });
  }
}
