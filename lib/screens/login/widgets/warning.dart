import 'dart:html';

import 'package:flutter/material.dart';

class Warning extends StatelessWidget {
  const Warning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xffDB215A)),
      ),
      child: const Text(
        "Login ou senha invalido",
        style: TextStyle(color: Color(0xffDB215A)),
      ),
    );
  }
}
