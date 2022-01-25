import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobx/mobx.dart';
import 'package:plat2/mobx/mob_dados.dart';
import 'package:plat2/mobx/models/model_dados_tabela.dart';

final Mob_Dados mob = GetIt.I<Mob_Dados>();
void salvar_dados() {
  try {
    var save = {
      'estado': mob.estado,
      'cad': mob.cad,
      'latitude': mob.latitude,
    };

    var resu = {};
    resu['index'] = mob.Lista_data_clima_media.length;
    for (var i = 0; i < mob.Lista_data_clima_media.length; i++) {
      resu['p' + i.toString()] = mob.Lista_data_clima_media[i].p;
      resu['t' + i.toString()] = mob.Lista_data_clima_media[i].t;
      resu['mes' + i.toString()] = mob.Lista_data_clima_media[i].mes;
      resu['ano' + i.toString()] = mob.Lista_data_clima_media[i].ano;
      resu['dias' + i.toString()] = mob.Lista_data_clima_media[i].cont_dias;
    }
    mob.box.put('result', resu);

    mob.box.put('dados', save);
  } catch (e) {
    print("erro al salvar");
  }
}

Future<void> carrega_dados() async {
  mob.box = await Hive.openBox('minhaCaixa1');
  if (mob.box.get('dados') != null) {
    var result = mob.box.get('dados');
    mob.estado = result['estado'];
    mob.cad = result['cad'];
    mob.latitude = result['latitude'];
  }
  if (mob.box.get('result') != null) {
    var re = mob.box.get('result');
    mob.Lista_data_clima_media = ObservableList();
    for (var i = 0; i < re['index']; i++) {
      mob.Lista_data_clima_media.add(
        DataClimaMedia(
          re['dias' + i.toString()],
          re['t' + i.toString()],
          re['p' + i.toString()],
          re['mes' + i.toString()],
          re['ano' + i.toString()],
        ),
      );
    }
    mob.calcula();
  }
}
