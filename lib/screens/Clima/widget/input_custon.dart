import 'package:flutter/material.dart';

class CustonTextField extends StatefulWidget {
  String valor;
  bool erro;
  Function func = (e) {};
  CustonTextField({
    Key? key,
    required this.valor,
    required this.func,
    required this.erro,
  }) : super(key: key);

  @override
  _CustonTextFieldState createState() => _CustonTextFieldState();
}

class _CustonTextFieldState extends State<CustonTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width / 1,
      child: TextFormField(
        initialValue: (widget.valor == '0.0') ? "" : widget.valor,
        onChanged: (e) {
          widget.func(e);
        },
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.amber, fontSize: 0.001),
          errorText: (widget.erro) ? 'asdasds' : null,
          isDense: true,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff1E123A), width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
