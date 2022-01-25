import 'package:flutter/material.dart';
import 'package:plat2/screens/principal.dart';
import 'package:plat2/screens/resultados/widget/car_graf.dart';
import 'package:plat2/screens/resultados/widget/graf1.dart';
import 'package:plat2/screens/resultados/widget/graf2.dart';
import 'package:plat2/screens/resultados/widget/graf3.dart';
import 'package:plat2/screens/resultados/widget/graf4.dart';
import 'package:plat2/screens/resultados/widget/tab1.dart';
import 'package:plat2/screens/resultados/widget/tab2.dart';
import 'package:plat2/screens/resultados/widget/tab3.dart';
import 'package:plat2/screens/resultados/widget/tab4.dart';

class Larg_resultado extends StatelessWidget {
  const Larg_resultado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Principal(
      select: 3,
      conteudo: Container(
        color: Color(0xffE9EAEE),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card_graf(
                tab: Tab4(),
                graf: Graf4(),
              ),
              Card_graf(
                tab: Tab3(),
                graf: Graf3(),
              ),
              Card_graf(
                tab: Tab1(),
                graf: Graf1(),
              ),
              Card_graf(
                tab: Tab2(),
                graf: Graf2(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
