import 'package:flutter/material.dart';

class Button__login extends StatefulWidget {
  String nome;
  Function func;
  bool isHover = false;
  bool load;
  Button__login({
    Key? key,
    required this.nome,
    required this.func,
    required this.load,
  }) : super(key: key);

  @override
  State<Button__login> createState() => _Button_menuState();
}

class _Button_menuState extends State<Button__login> {
  void hover(valor) {
    setState(() {
      widget.isHover = valor;
      if (valor == true) {
        cor1 = const Color(0xffDB215A);
        corbase = const Color(0xff4E436E);
      } else {
        cor1 = const Color(0xffFC8608);
        corbase = const Color(0xff1E123A);
      }
    });
  }

  Color cor1 = const Color(0xffFC8608);
  Color corbase = const Color(0xff1E123A);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          hover(true);
        },
        onExit: (_) {
          hover(false);
        },
        child: GestureDetector(
            onTap: () {
              widget.func();
            },
            child: AnimatedContainer(
              height: 50,
              width: double.infinity,
              child: Center(
                child: widget.load
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white, // Color(0xff4E436E),
                        ),
                      )
                    : Text(
                        widget.nome,
                        style: const TextStyle(color: Colors.white),
                      ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment
                      .bottomRight, // 10% of the width, so there are ten blinds.
                  colors: <Color>[cor1, const Color(0xffDB215A)],
                ),
              ),
              duration: const Duration(milliseconds: 150),
            )),
      ),
    );
  }
}
