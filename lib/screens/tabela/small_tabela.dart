import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plat2/mobx/login/mob_login.dart';
import 'package:plat2/screens/aviso_login/aviso_login.dart';
import 'package:plat2/screens/tabela/widgets/larg_tabela.dart';
import 'package:plat2/screens/widgets/drawer/drawer.dart';

class Small_tabela extends StatelessWidget {
  Small_tabela({Key? key}) : super(key: key);
  final Mob_login mob_login = GetIt.I<Mob_login>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1E123A),
        elevation: 0,
      ),
      drawer: Custon_Drawer(
        select: 2,
      ),
      body: !mob_login.logado ? Aviso() : LargTabela(),
    );
  }
}
