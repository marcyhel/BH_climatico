import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plat2/mobx/login/mob_login.dart';
import 'package:plat2/screens/aviso_login/aviso_login.dart';
import 'package:plat2/screens/resultados/widget/card_graf_small.dart';
import 'package:plat2/screens/resultados/widget/tab4.dart';

import 'package:plat2/screens/widgets/drawer/drawer.dart';

import 'widget/graf1.dart';
import 'widget/graf2.dart';
import 'widget/graf3.dart';
import 'widget/graf4.dart';
import 'widget/tab1.dart';
import 'widget/tab2.dart';
import 'widget/tab3.dart';

class Small_resultado extends StatelessWidget {
  Small_resultado({Key? key}) : super(key: key);
  final Mob_login mob_login = GetIt.I<Mob_login>();
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
      body: !mob_login.logado
          ? Aviso()
          : Container(
              color: const Color(0xffE9EAEE),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card_graf_small(
                      tab: Tab4(),
                      graf: Graf4(),
                    ),
                    Card_graf_small(
                      tab: Tab3(),
                      graf: Graf3(),
                    ),
                    Card_graf_small(
                      tab: Tab1(),
                      graf: Graf1(),
                    ),
                    Card_graf_small(
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
