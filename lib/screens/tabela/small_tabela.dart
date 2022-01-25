import 'package:flutter/material.dart';
import 'package:plat2/screens/tabela/widgets/larg_tabela.dart';
import 'package:plat2/screens/widgets/drawer/drawer.dart';

class Small_tabela extends StatelessWidget {
  const Small_tabela({Key? key}) : super(key: key);

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
      body: LargTabela(),
    );
  }
}
