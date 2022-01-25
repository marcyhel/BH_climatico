import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'package:plat2/mobx/mob_dados.dart';

import 'package:plat2/screens/tabela/small_tabela.dart';
import 'package:plat2/screens/tabela/widgets/larg_tabela.dart';
import 'package:plat2/screens/widgets/responsive.dart';

import '../principal.dart';

class TabelaDados extends StatelessWidget {
  TabelaDados({Key? key}) : super(key: key);
  final Mob_Dados mob = GetIt.I<Mob_Dados>();
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Small_tabela()
        : Principal(
            select: 2,
            conteudo: Container(
              color: Color(0xffE9EAEE),
              child: LargTabela(),
            ),
          );
  }
}
