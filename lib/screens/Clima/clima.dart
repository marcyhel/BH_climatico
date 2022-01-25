import 'package:flutter/material.dart';
import 'package:plat2/screens/Clima/larg_clima.dart';
import 'package:plat2/screens/Clima/small_clima.dart';
import 'package:plat2/screens/home/larg_home.dart';
import 'package:plat2/screens/widgets/responsive.dart';

class Clima_page extends StatelessWidget {
  const Clima_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? const Small_Clima()
        : Larg_clima();
  }
}
