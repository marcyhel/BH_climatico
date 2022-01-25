import 'package:flutter/material.dart';
import 'package:plat2/screens/Clima/widget/input_custon.dart';
import 'package:plat2/screens/widgets/responsive.dart';

class Card_cuaton_input extends StatelessWidget {
  String label;
  String valor;
  bool erro;
  Function func = (e) {};
  Card_cuaton_input({
    Key? key,
    required this.label,
    required this.func,
    required this.valor,
    required this.erro,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.13,
      margin: ResponsiveWidget.isSmallScreen(context)
          ? EdgeInsets.only(left: 0, bottom: 20)
          : EdgeInsets.only(left: 40, bottom: 20),
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
          CustonTextField(
            valor: valor,
            func: func,
            erro: erro,
          )
        ],
      ),
    );
  }
}
