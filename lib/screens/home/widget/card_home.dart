import 'package:flutter/material.dart';

class Card_home extends StatelessWidget {
  const Card_home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width / 7,
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 20,
        top: MediaQuery.of(context).size.height / 6.8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, 2),
            blurRadius: 5,
            color: Colors.black38,
          ),
        ],
      ),
      child: Text("data"),
    );
  }
}
