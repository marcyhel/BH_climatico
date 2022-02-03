import 'package:flutter/material.dart';
import 'package:plat2/screens/login/widgets/button_login.dart';
import 'package:plat2/screens/widgets/responsive.dart';

class Aviso extends StatelessWidget {
  const Aviso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Faça login para continuar",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: ResponsiveWidget.isSmallScreen(context)
                  ? MediaQuery.of(context).size.width / 2.3
                  : MediaQuery.of(context).size.width / 5,
              child: Button__login(
                  nome: "Login",
                  func: () {
                    Navigator.pushNamed(context, '');
                  },
                  load: false),
            ),
          ],
        ),
      ),
    );
  }
}
