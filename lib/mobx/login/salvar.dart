import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:plat2/mobx/login/mob_login.dart';

final Mob_login mob = GetIt.I<Mob_login>();
void Salvar_login() {
  var save = {
    'nome': mob.nome,
    'cpf': mob.cpf,
    'email': mob.email,
    'numero': mob.numero,
  };
  mob.box.put('login', save);
}

Future<void> carrega_login() async {
  mob.box = await Hive.openBox('minhaCaixa1');
  if (mob.box.get('login') != null) {
    var result = mob.box.get('login');
    mob.nome = result['nome'];
    mob.cpf = result['cpf'];
    mob.email = result['email'];
    mob.numero = result['numero'];
    mob.logado = true;
  }
}
