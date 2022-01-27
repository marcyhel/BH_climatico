import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plat2/mobx/mob_dados.dart';
import 'package:plat2/screens/Clima/widget/input_custon.dart';
import 'package:plat2/screens/widgets/responsive.dart';
import 'package:smart_dropdown/smart_dropdown.dart';

class Card_cuaton_Drop extends StatelessWidget {
  String label;
  String valor;
  bool erro;
  Function func = (e) {};
  Card_cuaton_Drop({
    Key? key,
    required this.label,
    required this.func,
    required this.valor,
    required this.erro,
  }) : super(key: key);
  final Mob_Dados mob = GetIt.I<Mob_Dados>();
  List<SmartDropdownMenuItem> items = [];
  List<String> UF = [
    "ARACAJU",
    "BELEM",
    "BELO HORIZONTE",
    "BOA VISTA",
    "BRASILIA",
    "CAMPO GRANDE",
    "CUIABA",
    "CURITIBA",
    "FLORIANOPOLIS",
    "FORTALEZA",
    "GOIANIA",
    "JOAO PESSOA",
    "MACAPA",
    "MACEIÓ",
    "MANAUS",
    "NATAL",
    "PALMAS",
    "PORTO ALEGRE",
    "PORTO VELHO",
    "RECIFE",
    "RIO BRANCO",
    "RIO DE JANEIRO",
    "SALVADOR",
    "SAO LUIS",
    "SAO PAULO",
    "TERESINA",
    "VITORIA",
  ];
  SmartDropdownMenuItem getItem(dynamic value, String item) {
    return SmartDropdownMenuItem(
      value: value,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    items = [];
    var cont = 0;
    UF.forEach((e) {
      cont++;
      items.add(
        getItem(cont, e),
      );
    });
    return Container(
      width: MediaQuery.of(context).size.width / 3.13,
      margin: ResponsiveWidget.isSmallScreen(context)
          ? const EdgeInsets.only(left: 0, bottom: 20)
          : const EdgeInsets.only(left: 40, bottom: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(blurRadius: 5, color: Colors.black26, offset: Offset(1, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 20),
            child: SmartDropDown(
              items: items,
              hintText: mob.estado == "" ? " UF " : mob.estado,
              borderRadius: 10,
              maxListHeight: 150,
              borderColor: const Color(0xff1E123A),
              expandedColor: const Color(0xff1E123A),
              onChanged: (e) {
                mob.setEstado(UF[e - 1]);
                print(mob.estado);
              },
            ),
          ),
        ],
      ),
    );
  }
}
