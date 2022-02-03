import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:plat2/mobx/login/mob_login.dart';
import 'package:plat2/mobx/mob_dados.dart';
import 'package:plat2/mobx/models/salvar.dart';
import 'package:plat2/screens/Clima/widget/button_clima.dart';
import 'package:plat2/screens/Clima/widget/tabela.dart';
import 'package:plat2/screens/aviso_login/aviso_login.dart';
import 'package:plat2/screens/widgets/drawer/drawer.dart';

import 'widget/card_custon_drop.dart';
import 'widget/card_custon_input.dart';

class Small_Clima extends StatefulWidget {
  const Small_Clima({Key? key}) : super(key: key);

  @override
  State<Small_Clima> createState() => _Small_ClimaState();
}

class _Small_ClimaState extends State<Small_Clima> {
  final Mob_Dados mob = GetIt.I<Mob_Dados>();
  final Mob_login mob_login = GetIt.I<Mob_login>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1E123A),
        elevation: 0,
      ),
      drawer: Custon_Drawer(
        select: 1,
      ),
      body: !mob_login.logado
          ? Aviso()
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xffE9EAEE),
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  color: Color(0xffE9EAEE),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.15,
                        child: Card_cuaton_Drop(
                          label: "Estado",
                          valor: '54',
                          func: () {},
                          erro: false,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.15,
                        child: Card_cuaton_input(
                          label: "CAD",
                          valor: mob.cad,
                          func: mob.setCad,
                          erro: mob.bool_cad,
                        ),
                      ),
                      Observer(
                        builder: (_) {
                          return Container(
                            width: MediaQuery.of(context).size.width / 1.15,
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Custon_button(
                              text: "Sincronizar",
                              carrega: mob.isLoad,
                              func: () async {
                                await mob.sincronizar_dados()
                                    ? setState(() {
                                        mob.setIsload(false);
                                      })
                                    : ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Color(0xffDB215A),
                                          duration: Duration(seconds: 2),
                                          content: Text(
                                              'Ouve algum erro com o ESTADO escolhido.'),
                                        ),
                                      );
                                mob.setIsload(false);
                              },
                            ),
                          );
                        },
                      ),
                      Observer(builder: (_) {
                        return Container(
                          // width: MediaQuery.of(context).size.width / 1.55,
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                          width: MediaQuery.of(context).size.width /
                              1.15, //left: MediaQuery.of(context).size.width / 80),
                          child: Custon_button(
                            text: "Calcular",
                            carrega: mob.isLoad,
                            func: () {
                              salvar_dados();
                              mob.calcula()
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Color(0xff4E436E),
                                        duration: Duration(seconds: 2),
                                        content:
                                            Text('Calculado com sucesso !! '),
                                      ),
                                    )
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Color(0xffDB215A),
                                        duration: Duration(seconds: 2),
                                        content: Text(
                                            'Ouve algum erro durante os calculos.'),
                                      ),
                                    );
                            },
                          ),
                        );
                      }),
                      const SizedBox(height: 20),
                      Tabela(
                        marge: EdgeInsets.only(left: 0, right: 0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
