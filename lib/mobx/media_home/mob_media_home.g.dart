// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mob_media_home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Mob_media_home on _Mob_media_homeBase, Store {
  final _$Lista_data_climaAtom =
      Atom(name: '_Mob_media_homeBase.Lista_data_clima');

  @override
  ObservableList<dynamic> get Lista_data_clima {
    _$Lista_data_climaAtom.reportRead();
    return super.Lista_data_clima;
  }

  @override
  set Lista_data_clima(ObservableList<dynamic> value) {
    _$Lista_data_climaAtom.reportWrite(value, super.Lista_data_clima, () {
      super.Lista_data_clima = value;
    });
  }

  final _$isLoadAtom = Atom(name: '_Mob_media_homeBase.isLoad');

  @override
  bool get isLoad {
    _$isLoadAtom.reportRead();
    return super.isLoad;
  }

  @override
  set isLoad(bool value) {
    _$isLoadAtom.reportWrite(value, super.isLoad, () {
      super.isLoad = value;
    });
  }

  final _$sincronizar_dadosAsyncAction =
      AsyncAction('_Mob_media_homeBase.sincronizar_dados');

  @override
  Future<bool> sincronizar_dados() {
    return _$sincronizar_dadosAsyncAction.run(() => super.sincronizar_dados());
  }

  final _$_Mob_media_homeBaseActionController =
      ActionController(name: '_Mob_media_homeBase');

  @override
  void setIsload(dynamic valor) {
    final _$actionInfo = _$_Mob_media_homeBaseActionController.startAction(
        name: '_Mob_media_homeBase.setIsload');
    try {
      return super.setIsload(valor);
    } finally {
      _$_Mob_media_homeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
Lista_data_clima: ${Lista_data_clima},
isLoad: ${isLoad}
    ''';
  }
}
