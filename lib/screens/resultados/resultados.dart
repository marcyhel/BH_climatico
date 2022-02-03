import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plat2/mobx/login/mob_login.dart';
import 'package:plat2/screens/resultados/larg_resultado.dart';
import 'package:plat2/screens/resultados/small_resultado.dart';
import 'package:plat2/screens/tabela/widgets/larg_tabela.dart';
import 'package:plat2/screens/widgets/drawer/drawer.dart';
import 'package:plat2/screens/widgets/responsive.dart';

class Resultados extends StatelessWidget {
  Resultados({Key? key}) : super(key: key);
  final Mob_login mob_login = GetIt.I<Mob_login>();
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Small_resultado()
        : Larg_resultado();
  }
}
