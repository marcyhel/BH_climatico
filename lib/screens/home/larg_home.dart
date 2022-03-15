import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plat2/mobx/login/mob_login.dart';
import 'package:plat2/mobx/media_home/mob_media_home.dart';
import 'package:plat2/screens/aviso_login/aviso_login.dart';
import 'package:plat2/screens/home/widget/card_home.dart';
import 'package:plat2/screens/home/widget/graf_media.dart';
import 'package:plat2/screens/principal.dart';

class Larg_home extends StatelessWidget {
  Larg_home({Key? key}) : super(key: key);
  final Mob_login mob_login = GetIt.I<Mob_login>();
  final Mob_media_home mob_media = GetIt.I<Mob_media_home>();
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
                      child: Container(
                        margin: EdgeInsets.only(top: 40, left: 60),
                        child: const Text(
                          "BHCN",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35),
                        ),
                      ),
                    ),
                    Container(
                      // color: Colors.amber,
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 6.8,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 230,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Card_home(img: "assets/1.png"),
                          Card_home(img: "assets/tb1.png"),
                          Card_home(img: "assets/2.png"),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 0, right: 0, left: 0, child: Graf_Media()),
                    Container(
                      height: MediaQuery.of(context).size.height,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
