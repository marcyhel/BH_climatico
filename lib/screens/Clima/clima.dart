import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plat2/mobx/login/mob_login.dart';
import 'package:plat2/screens/Clima/larg_clima.dart';
import 'package:plat2/screens/Clima/small_clima.dart';
import 'package:plat2/screens/home/larg_home.dart';
import 'package:plat2/screens/widgets/responsive.dart';

class Clima_page extends StatelessWidget {
  Clima_page({Key? key}) : super(key: key);
  final Mob_login mob_login = GetIt.I<Mob_login>();
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? const Small_Clima()
        : Larg_clima();
  }
}
