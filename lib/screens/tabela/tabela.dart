import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:plat2/mobx/login/mob_login.dart';

import 'package:plat2/mobx/mob_dados.dart';
import 'package:plat2/screens/aviso_login/aviso_login.dart';

import 'package:plat2/screens/tabela/small_tabela.dart';
import 'package:plat2/screens/tabela/widgets/larg_tabela.dart';
import 'package:plat2/screens/widgets/responsive.dart';

import '../principal.dart';

class TabelaDados extends StatelessWidget {
  TabelaDados({Key? key}) : super(key: key);
  final Mob_Dados mob = GetIt.I<Mob_Dados>();
  final Mob_login mob_login = GetIt.I<Mob_login>();
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Small_tabela()
        : Principal(
            select: 2,
            conteudo: !mob_login.logado
                ? Aviso()
                : Container(
                    color: Color(0xffE9EAEE),
                    child: LargTabela(),
                  ),
          );
  }
}
