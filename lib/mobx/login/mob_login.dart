// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import 'package:mobx/mobx.dart';
import 'package:plat2/mobx/login/salvar.dart';
part 'mob_login.g.dart';

class Mob_login = _Mob_loginBase with _$Mob_login;

abstract class _Mob_loginBase with Store {
  Box box;
  _Mob_loginBase(this.box) {}
  @observable
  String nome = '';
  @observable
  String cpf = '';
  @observable
  String numero = '';
  @observable
  bool status_error = false;
  @observable
  String email = '';
  @observable
  bool bool_email = false;
  @observable
  String pass = '';
  @observable
  bool bool_pass = false;
  @observable
  bool logado = false;
  @observable
  bool load = false;
  @action
  setEmail(valor) => email = valor;
  @action
  setPass(valor) => pass = valor;
  @action
  setLogado(valor) => logado = valor;
  @computed
  bool get emailValido =>
      email != '' &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
  String get emailErro {
    if (email == '' || emailValido) {
      return '';
    } else if (email.isEmpty) {
      return "Campo Obrigatorio";
    } else {
      return "E-mail invalido";
    }
  }

  @computed
  bool get senhaValida => pass != '' && pass.length >= 5;
  String get senhaError {
    if (pass == '' || senhaValida) {
      return '';
    } else if (pass.isEmpty) {
      return "Campo Obrigatorio";
    } else {
      return "Senha muito curta";
    }
  }

  @action
  Future<bool> LoginPress() async {
    load = true;
    //await Future.delayed(Duration(seconds: 3));

    try {
      var url =
          'https://teste-api-res.herokuapp.com/get_bh_clima?email=${email}&pass=${pass}';
      var response = await http.get(
        Uri.parse(url),
      );
      var res = json.decode(response.body);
      if (res.length > 0) {
        status_error = false;
        nome = res[0]['nome'];
        cpf = res[0]['cpf'];
        numero = res[0]['cpf'];
        setLogado(true);
        Salvar_login();
        return true;
      } else {
        status_error = true;
      }
      print(res);
    } catch (e) {
      print(e);
    }
    load = false;
    return false;
  }
}
