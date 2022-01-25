import 'package:flutter/material.dart';

class Card_graf extends StatelessWidget {
  Widget graf;
  Widget tab;
  Card_graf({
    Key? key,
    required this.graf,
    required this.tab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(blurRadius: 5, color: Colors.black26, offset: Offset(1, 2))
        ],
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
      child: Row(
        children: [
          Container(child: tab),
          Expanded(
            child: graf,
          ),
        ],
      ),
    );
  }
}
