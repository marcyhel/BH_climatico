import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:plat2/mobx/mob_dados.dart';
import 'package:plat2/mobx/models/salvar.dart';
import 'package:plat2/screens/Clima/widget/button_clima.dart';
import 'package:plat2/screens/Clima/widget/card_custon_drop.dart';
import 'package:plat2/screens/Clima/widget/card_custon_input.dart';
import 'package:plat2/screens/Clima/widget/input_custon.dart';
import 'package:plat2/screens/Clima/widget/tabela.dart';
import 'package:plat2/screens/principal.dart';

class Larg_clima extends StatefulWidget {
  Larg_clima({Key? key}) : super(key: key);

  @override
  State<Larg_clima> createState() => _Larg_climaState();
}

class _Larg_climaState extends State<Larg_clima> {
  final Mob_Dados mob = GetIt.I<Mob_Dados>();

  @override
  Widget build(BuildContext context) {
    return Principal(
      select: 1,
      conteudo: Container(
        color: Color(0xffE9EAEE),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 30, bottom: 30),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card_cuaton_Drop(
                      label: "Estado",
                      valor: '54',
                      func: () {},
                      erro: false,
                    ),
                    Card_cuaton_input(
                      label: "CAD",
                      valor: mob.cad,
                      func: mob.setCad,
                      erro: mob.bool_cad,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Tabela(marge: EdgeInsets.only(left: 40, right: 20)),
                    Observer(builder: (_) {
                      return Column(
                        children: [
                          Custon_button(
                            func: () async {
                              await mob.sincronizar_dados()
                                  ? setState(() {
                                      mob.setIsload(false);
                                    })
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Color(0xffDB215A),
                                        duration: Duration(seconds: 2),
                                        content: Text(
                                            'Ouve algum erro com o ESTADO escolhido.'),
                                      ),
                                    );
                              mob.setIsload(false);
                            },
                            text: "Sincronizar",
                            carrega: mob.isLoad,
                          ),
                          const SizedBox(height: 20),
                          Custon_button(
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
                            text: "Calcular",
                            carrega: mob.isLoad,
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
