import 'package:flutter/material.dart';

import 'widgets/menu_larg.dart';

class Principal extends StatefulWidget {
  int select;
  Widget conteudo;
  Principal({
    Key? key,
    required this.select,
    required this.conteudo,
  }) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Menu_larg(select: widget.select),
          Expanded(child: widget.conteudo)
        ],
      ),
    );
  }
}
