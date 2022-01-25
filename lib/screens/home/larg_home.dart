import 'package:flutter/material.dart';
import 'package:plat2/screens/principal.dart';

class Larg_home extends StatelessWidget {
  const Larg_home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Principal(
      select: 0,
      conteudo: Container(
          color: Colors.amber,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          )),
    );
  }
}
