import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import 'package:plat2/mobx/mob_dados.dart';
import 'package:plat2/screens/widgets/responsive.dart';

import 'imput_tabela.dart';

final Mob_Dados mob = GetIt.I<Mob_Dados>();

class Tabela extends StatelessWidget {
  EdgeInsets marge;
  Tabela({
    Key? key,
    required this.marge,
  }) : super(key: key);
  int conta = 0;

  int index = 0;

  int indeCo = 1;

  int indexDado = 0;
  @override
  Widget build(BuildContext context) {
    print("desenhando");
    return Observer(builder: (_) {
      return SingleChildScrollView(
        child: Container(
          margin: marge,
          width: ResponsiveWidget.isSmallScreen(context)
              ? MediaQuery.of(context).size.width / 1.15
              : MediaQuery.of(context).size.width / 1.95,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 5, color: Colors.black26, offset: Offset(2, 2))
              ]),
          child: DataTable(
            columnSpacing: 2,
            dividerThickness: 0.1,
            columns: const [
              DataColumn(
                  label: Expanded(
                child: Text(
                  "Data",
                  textAlign: TextAlign.center,
                ),
              )),
              DataColumn(
                  label: Expanded(
                child: Text(
                  "T °C",
                  textAlign: TextAlign.center,
                ),
              )),
              DataColumn(
                  label: Expanded(
                child: Text(
                  "p mm",
                  textAlign: TextAlign.center,
                ),
              ))
            ],
            rows: mob.Lista_data_clima_media.map((element) {
              conta = 0;
              index++;
              indexDado++;
              return DataRow(
                  color: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    indeCo++;

                    if (indeCo % 2 == 0) {
                      return Colors.black12;
                    }
                    return Theme.of(context).cardColor;
                  }),
                  cells: [
                    DataCell(
                      Center(
                          child: Text(
                        "${element.mes} - ${element.ano}",
                        style: const TextStyle(fontSize: 15),
                      )),
                    ),
                    DataCell(
                      Center(
                        child: ImputTabela(
                            func: (e) {
                              element.t = double.parse(e);
                              print(e);
                            },
                            valor: element.t
                                .toString()), //Text(element.t!.toStringAsFixed(2)),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: ImputTabela(
                            func: (e) {
                              element.p = double.parse(e);
                            },
                            valor: element.p.toStringAsFixed(
                                2)), //Text(element.p!.toStringAsFixed(2)),
                      ),
                    ),
                  ]);
            }).toList(),
          ),
        ),
      );
    });
  }
}
