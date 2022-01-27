// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mob_login.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Mob_login on _Mob_loginBase, Store {
  Computed<bool>? _$emailValidoComputed;

  @override
  bool get emailValido =>
      (_$emailValidoComputed ??= Computed<bool>(() => super.emailValido,
              name: '_Mob_loginBase.emailValido'))
          .value;
  Computed<bool>? _$senhaValidaComputed;

  @override
  bool get senhaValida =>
      (_$senhaValidaComputed ??= Computed<bool>(() => super.senhaValida,
              name: '_Mob_loginBase.senhaValida'))
          .value;

  final _$emailAtom = Atom(name: '_Mob_loginBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$bool_emailAtom = Atom(name: '_Mob_loginBase.bool_email');

  @override
  bool get bool_email {
    _$bool_emailAtom.reportRead();
    return super.bool_email;
  }

  @override
  set bool_email(bool value) {
    _$bool_emailAtom.reportWrite(value, super.bool_email, () {
      super.bool_email = value;
    });
  }

  final _$passAtom = Atom(name: '_Mob_loginBase.pass');

  @override
  String? get pass {
    _$passAtom.reportRead();
    return super.pass;
  }

  @override
  set pass(String? value) {
    _$passAtom.reportWrite(value, super.pass, () {
      super.pass = value;
    });
  }

  final _$bool_passAtom = Atom(name: '_Mob_loginBase.bool_pass');

  @override
  bool get bool_pass {
    _$bool_passAtom.reportRead();
    return super.bool_pass;
  }

  @override
  set bool_pass(bool value) {
    _$bool_passAtom.reportWrite(value, super.bool_pass, () {
      super.bool_pass = value;
    });
  }

  final _$logadoAtom = Atom(name: '_Mob_loginBase.logado');

  @override
  bool get logado {
    _$logadoAtom.reportRead();
    return super.logado;
  }

  @override
  set logado(bool value) {
    _$logadoAtom.reportWrite(value, super.logado, () {
      super.logado = value;
    });
  }

  final _$loadAtom = Atom(name: '_Mob_loginBase.load');

  @override
  bool get load {
    _$loadAtom.reportRead();
    return super.load;
  }

  @override
  set load(bool value) {
    _$loadAtom.reportWrite(value, super.load, () {
      super.load = value;
    });
  }

  final _$LoginPressAsyncAction = AsyncAction('_Mob_loginBase.LoginPress');

  @override
  Future<void> LoginPress() {
    return _$LoginPressAsyncAction.run(() => super.LoginPress());
  }

  final _$_Mob_loginBaseActionController =
      ActionController(name: '_Mob_loginBase');

  @override
  dynamic setEmail(dynamic valor) {
    final _$actionInfo = _$_Mob_loginBaseActionController.startAction(
        name: '_Mob_loginBase.setEmail');
    try {
      return super.setEmail(valor);
    } finally {
      _$_Mob_loginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPass(dynamic valor) {
    final _$actionInfo = _$_Mob_loginBaseActionController.startAction(
        name: '_Mob_loginBase.setPass');
    try {
      return super.setPass(valor);
    } finally {
      _$_Mob_loginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
bool_email: ${bool_email},
pass: ${pass},
bool_pass: ${bool_pass},
logado: ${logado},
load: ${load},
emailValido: ${emailValido},
senhaValida: ${senhaValida}
    ''';
  }
}
