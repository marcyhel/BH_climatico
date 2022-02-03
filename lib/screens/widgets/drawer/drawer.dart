import 'dart:math';

import 'package:flutter/material.dart';

import '../menu_larg.dart';
import '../status_user_menu.dart';

class Custon_Drawer extends StatelessWidget {
  int select;
  Custon_Drawer({
    Key? key,
    required this.select,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Bt_menu> bt_menu = [
      Bt_menu(
          nome: 'Home page',
          func: () {
            Navigator.pushNamed(context, '/home');
          },
          selec: false),
      Bt_menu(
          nome: 'Dados',
          func: () {
            Navigator.pushNamed(context, '/clima');
          },
          selec: false),
      Bt_menu(
          nome: 'Planilha',
          func: () {
            Navigator.pushNamed(context, '/tabela');
          },
          selec: false),
      Bt_menu(
          nome: 'Resultados',
          func: () {
            Navigator.pushNamed(context, '/resultado');
          },
          selec: false),
    ];
    bt_menu[select].selec = true;
    return Container(
      padding: EdgeInsets.all(20),
      height: double.infinity,
      width: max(MediaQuery.of(context).size.width / 2.5, 300),
      color: Color(0xff1E123A),
      child: Column(
        children: [
          State_user(),
          ...List<Widget>.generate(bt_menu.length, (index) {
            return Button_menu(
              nome: bt_menu[index].nome,
              func: bt_menu[index].func,
              selec: bt_menu[index].selec,
            );
          }),
        ],
      ),
    );
  }
}
