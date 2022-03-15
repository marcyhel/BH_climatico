import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plat2/mobx/login/mob_login.dart';
import 'package:plat2/screens/aviso_login/aviso_login.dart';
import 'package:plat2/screens/home/widget/graf_media.dart';
import 'package:plat2/screens/widgets/drawer/drawer.dart';

import 'widget/card_home.dart';

class Small_home extends StatelessWidget {
  Small_home({Key? key}) : super(key: key);
  final Mob_login mob_login = GetIt.I<Mob_login>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BHCN",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Color(0xff1E123A),
        elevation: 0,
      ),
      drawer: Custon_Drawer(
        select: 0,
      ),
      body: !mob_login.logado
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
                        color: Color(0xff1E123A),
                      ),
                      //color: Color(0xff4E436E),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 7,
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 20),
                      ),
                    ),
                    Container(
                      // color: Colors.amber,
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 25.8,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 250,
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
                        top: 200,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Graf_Media()),
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
