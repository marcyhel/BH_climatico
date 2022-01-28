import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:plat2/mobx/login/mob_login.dart';
import 'package:plat2/mobx/mob_dados.dart';
import 'package:plat2/screens/login/widgets/button_login.dart';
import 'package:plat2/screens/login/widgets/imput_login.dart';
import 'package:plat2/screens/login/widgets/warning.dart';

class Larg_login extends StatefulWidget {
  Larg_login({Key? key}) : super(key: key);

  @override
  State<Larg_login> createState() => _Larg_loginState();
}

class _Larg_loginState extends State<Larg_login> {
  final Mob_login mob = GetIt.I<Mob_login>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E123A),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width / 3 < 400
                ? 400
                : MediaQuery.of(context).size.width / 3,
            //height: 200,
            padding:
                const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 10),
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 5, color: Colors.black26, offset: Offset(1, 2))
              ],
            ),
            child: Observer(builder: (_) {
              return Column(
                children: [
                  mob.status_error ? Warning() : Container(),
                  CustonTextField_login(
                    valor: 'Ex. maria@email.com',
                    label: 'E-mail',
                    func: (e) {
                      mob.setEmail(e);
                    },
                    erro: mob.emailErro,
                  ),
                  CustonTextField_login(
                    valor: '',
                    label: 'Senha',
                    func: (e) {
                      mob.setPass(e);
                    },
                    erro: mob.senhaError,
                  ),
                  const Divider(),
                  Button__login(
                      nome: "Login",
                      func: () async {
                        await mob.LoginPress()
                            ? {
                                Navigator.pushNamed(context, '/clima'),
                                mob.logado = true
                              }
                            : null;
                      },
                      load: mob.load),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
