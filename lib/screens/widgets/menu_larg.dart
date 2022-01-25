import 'dart:math';

import 'package:flutter/material.dart';
import 'package:plat2/screens/widgets/status_user_menu.dart';

class Bt_menu {
  bool selec;
  String nome;
  Function func;
  Bt_menu({
    required this.selec,
    required this.nome,
    required this.func,
  });
}

class Menu_larg extends StatelessWidget {
  int select;
  Menu_larg({
    Key? key,
    required this.select,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Bt_menu> bt_menu = [
      Bt_menu(
          nome: 'Home page',
          func: () {
            Navigator.pushNamed(context, '');
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
      height: MediaQuery.of(context).size.height,
      width: max(MediaQuery.of(context).size.width / 5, 200),
      padding: EdgeInsets.only(left: 30, right: 20, top: 50),
      color: Color(0xff1E123A),
      child: Column(children: [
        State_user(),
        ...List<Widget>.generate(bt_menu.length, (index) {
          return Button_menu(
            nome: bt_menu[index].nome,
            func: index == select ? () {} : bt_menu[index].func,
            selec: bt_menu[index].selec,
          );
        }),
      ]),
    );
  }
}

class Button_menu extends StatefulWidget {
  bool selec;
  String nome;
  Function func;
  bool isHover = false;
  Button_menu({
    Key? key,
    required this.selec,
    required this.nome,
    required this.func,
  }) : super(key: key);

  @override
  State<Button_menu> createState() => _Button_menuState();
}

class _Button_menuState extends State<Button_menu> {
  void hover(valor) {
    setState(() {
      widget.isHover = valor;
      if (valor == true) {
        corbase = Color(0xff4E436E);
      } else {
        corbase = Color(0xff1E123A);
      }
    });
  }

  Color corbase = Color(0xff1E123A);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          hover(true);
        },
        onExit: (_) {
          hover(false);
        },
        child: GestureDetector(
          onTap: () {
            widget.func();
          },
          child: widget.selec
              ? Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      widget.nome,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment
                          .bottomRight, // 10% of the width, so there are ten blinds.
                      colors: <Color>[Color(0xffFC8608), Color(0xffDB215A)],
                    ),
                  ),
                )
              : AnimatedContainer(
                  height: 50,
                  width: double.infinity,
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: corbase,
                  ),
                  child: Center(
                    child: Text(
                      widget.nome,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
