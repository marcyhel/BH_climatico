import 'package:flutter/material.dart';
import 'package:plat2/screens/resultados/larg_resultado.dart';
import 'package:plat2/screens/resultados/small_resultado.dart';
import 'package:plat2/screens/tabela/widgets/larg_tabela.dart';
import 'package:plat2/screens/widgets/drawer/drawer.dart';
import 'package:plat2/screens/widgets/responsive.dart';

class Resultados extends StatelessWidget {
  const Resultados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? const Small_resultado()
        : Larg_resultado();
  }
}
