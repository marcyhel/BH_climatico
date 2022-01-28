import 'package:flutter/material.dart';

class CustonTextField_login extends StatefulWidget {
  String valor;
  String label;
  String erro;
  Function func;
  CustonTextField_login({
    Key? key,
    required this.valor,
    required this.label,
    required this.func,
    required this.erro,
  }) : super(key: key);

  @override
  _CustonTextFieldState createState() => _CustonTextFieldState();
}

class _CustonTextFieldState extends State<CustonTextField_login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width / 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, bottom: 10, top: 20),
            child: Text(
              widget.label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            //initialValue: (widget.valor == '0.0') ? "" : widget.valor,
            onChanged: (e) {
              widget.func(e);
            },
            decoration: InputDecoration(
              hintText: widget.valor,
              //errorStyle:
              //  const TextStyle(color: Colors.red), // fontSize: 0.001),
              errorText: widget.erro == '' ? null : widget.erro,
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
        ],
      ),
    );
  }
}
