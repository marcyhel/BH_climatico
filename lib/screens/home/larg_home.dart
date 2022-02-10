import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plat2/mobx/login/mob_login.dart';
import 'package:plat2/screens/aviso_login/aviso_login.dart';
import 'package:plat2/screens/home/widget/card_home.dart';
import 'package:plat2/screens/principal.dart';

class Larg_home extends StatelessWidget {
  Larg_home({Key? key}) : super(key: key);
  final Mob_login mob_login = GetIt.I<Mob_login>();
  @override
  Widget build(BuildContext context) {
    return Principal(
      select: 0,
      conteudo: !mob_login.logado
          ? Aviso()
          : Container(
              color: Color(0xffE9EAEE),
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment
                              .bottomRight, // 10% of the width, so there are ten blinds.
                          colors: <Color>[
                            Color(0xff1E123A),
                            Color(0xff4E436E),
                          ],
                        ),
                      ),
                      //color: Color(0xff4E436E),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          Card_home(),
                          Card_home(),
                          Card_home(),
                          Card_home()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
