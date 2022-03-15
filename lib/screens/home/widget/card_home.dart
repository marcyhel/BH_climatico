import 'package:flutter/material.dart';

class Card_home extends StatelessWidget {
  String img;
  Card_home({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -10,
          left: -15,
          child: Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 20,
              bottom: 10,
              top: 10,
            ),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment
                    .bottomRight, // 10% of the width, so there are ten blinds.
                colors: <Color>[Color(0xffFC8608), Color(0xffDB215A)],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 20,
            bottom: 10,
            top: 10,
          ),
          child: Center(
              child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.fill,
              ),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(1, 2),
                  blurRadius: 5,
                  color: Colors.black38,
                ),
              ],
            ),
          )),
        ),
      ],
    );
  }
}
