import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plat2/mobx/login/mob_login.dart';
import 'package:plat2/screens/login/larg_login.dart';

final Mob_login mob = GetIt.I<Mob_login>();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      mob.logado ? Navigator.pushNamed(context, '/clima') : null;
    });

    super.initState();
  }

  markNeedsBuild() {
    mob.logado ? Navigator.pushNamed(context, '/clima') : null;
  }

  @override
  Widget build(BuildContext context) {
    return Larg_login();
  }
}
