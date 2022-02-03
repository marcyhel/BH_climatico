import 'package:flutter/material.dart';
import 'package:plat2/screens/home/larg_home.dart';
import 'package:plat2/screens/widgets/responsive.dart';

import 'small_home.dart';

class Home_page extends StatelessWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context) ? Small_home() : Larg_home();
  }
}
