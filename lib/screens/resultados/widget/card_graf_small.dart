import 'package:flutter/material.dart';

class Card_graf_small extends StatelessWidget {
  Widget graf;
  Widget tab;
  Card_graf_small({
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
      margin: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
      child: Column(
        children: [
          graf,
          Container(width: double.infinity, child: tab),
        ],
      ),
    );
  }
}
