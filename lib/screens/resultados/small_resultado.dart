import 'package:flutter/material.dart';
import 'package:plat2/screens/tabela/widgets/larg_tabela.dart';
import 'package:plat2/screens/widgets/drawer/drawer.dart';

class Small_resultado extends StatelessWidget {
  const Small_resultado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1E123A),
        elevation: 0,
      ),
      drawer: Custon_Drawer(
        select: 3,
      ),
      body: LargTabela(),
    );
  }
}
