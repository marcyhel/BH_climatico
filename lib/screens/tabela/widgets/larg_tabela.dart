// ignore: file_names
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:lazy_data_table/lazy_data_table.dart';

import 'package:plat2/mobx/mob_dados.dart';

import 'cell.dart';

final Mob_Dados mob = GetIt.I<Mob_Dados>();

class LargTabela extends StatelessWidget {
  LargTabela({Key? key}) : super(key: key);
  final _scrollController = ScrollController();
  final _scrollController2 = ScrollController();
  @override
  List<String> headerColumn = [
    'Tempo\nmeses',
    'numero de\ndias',
    'NDA',
    'T ºC',
    'P\nmm',
    'N\nHoras',
    'I',
    'ETP',
    'P-ETP\nmm',
    'NEG-AC',
    'ARM\nmm',
    'ALT\nmm',
    'ETR\nmm',
    'DEF\nmm',
    'EXC\nmm',
    'δ',
    'hn',
  ];
  Widget build(BuildContext context) {
    return LazyDataTable(
      tableTheme: LazyDataTableTheme(
        cornerColor: Theme.of(context).cardColor,
        cornerBorder: const Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black26)),
        columnHeaderColor: Colors.white,
        rowHeaderColor: Colors.black12,
        rowHeaderBorder: const Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black26)),
        alternateRowHeaderBorder: const Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black26)),
        alternateRowHeaderColor: Colors.white,
        alternateCellColor: Colors.white,
        cellColor: Colors.black12,
        columnHeaderBorder: const Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black26)),
        cellBorder: const Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black12)),
        alternateCellBorder: const Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black12)),
      ),
      rows: mob.Lista_data_clima_media.length,
      columns: headerColumn.length,
      tableDimensions: const LazyDataTableDimensions(
        cellHeight: 30,
        cellWidth: 100,
        topHeaderHeight: 90,
        leftHeaderWidth: 40,
      ),
      topHeaderBuilder: (i) => Center(
          child: Text(
        headerColumn[i],
        textAlign: TextAlign.center,
      )),
      leftHeaderBuilder: (i) => Center(child: Text("${i + 1}")),
      dataCellBuilder: (i, j) => Cell(i: i, j: j),
      /*dataCellBuilder: (i, j) {
        print('$i  -   $j');
        return Center(child: Text("Cell: $i, $j"));
      },*/
      topLeftCornerWidget: const Center(child: Text("")),
    ); /*DataTable2(
      headingRowHeight: 50.0,
      dataRowHeight: 40.0,
      showCheckboxColumn: true,
      columns: const [
        DataColumn(
          label: Text('Name'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text('Name'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text('Name'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
      ],
      rows: List<DataRow>.generate(
        20,
        (int index) => DataRow(
          cells: <DataCell>[
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
          ],
          onSelectChanged: (bool? value) {},
        ),
      ),
    );*/
  }
}
