import 'package:mobx/mobx.dart';
part 'mob_login.g.dart';

class Mob_login = _Mob_loginBase with _$Mob_login;

abstract class _Mob_loginBase with Store {
  _Mob_loginBase() {
    autorun(_) {
      print(email);
    }
  }
  @observable
  String? email;
  @observable
  bool bool_email = false;
  @observable
  String? pass;
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
  @computed
  bool get emailValido =>
      email != null &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email!);
  String get emailErro {
    if (email == null || emailValido) {
      return '';
    } else if (email!.isEmpty) {
      return "Campo Obrigatorio";
    } else {
      return "E-mail invalido";
    }
  }

  @computed
  bool get senhaValida => pass != null && pass!.length >= 5;
  String get senhaError {
    if (pass == null || senhaValida) {
      return '';
    } else if (pass!.isEmpty) {
      return "Campo Obrigatorio";
    } else {
      return "Senha muito curta";
    }
  }

  @action
  Future<void> LoginPress() async {
    load = true;
    await Future.delayed(Duration(seconds: 3));
    try {} catch (e) {
      // print(error);
    }
    load = false;
  }
}
