import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'mob_media_home.g.dart';

class Mob_media_home = _Mob_media_homeBase with _$Mob_media_home;

abstract class _Mob_media_homeBase with Store {
  _Mob_media_homeBase() {
    sincronizar_dados();
  }
  @observable
  ObservableList Lista_data_clima = ObservableList();
  @observable
  bool isLoad = false;
  @action
  void setIsload(valor) => isLoad = valor;
  String verificaIndexEstado(int estado) {
    if (estado == 20) {
      return 'AC';
    }
    if (estado == 13) {
      return 'AL';
    }
    if (estado == 12) {
      return 'AP';
    }
    if (estado == 14) {
      return 'AM';
    }
    if (estado == 22) {
      return 'BA';
    }
    if (estado == 9) {
      return 'CE'; //
    }
    if (estado == 4) {
      return 'DF'; //
    }
    if (estado == 10) {
      return 'GO';
    }
    if (estado == 23) {
      return 'MA';
    }
    if (estado == 6) {
      return 'MT'; //
    }
    if (estado == 5) {
      return 'MS'; //
    }
    if (estado == 2) {
      return 'MG'; //
    }
    if (estado == 1) {
      return 'PA'; //
    }
    if (estado == 11) {
      return 'PB';
    }
    if (estado == 7) {
      return 'PR'; //
    }
    if (estado == 19) {
      return 'PE';
    }
    if (estado == 25) {
      return 'PI';
    }
    if (estado == 21) {
      return 'RJ';
    }
    if (estado == 15) {
      return 'RN';
    }
    if (estado == 17) {
      return 'RS';
    }
    if (estado == 18) {
      return 'RO';
    }
    if (estado == 3) {
      return 'RR'; //
    }
    if (estado == 8) {
      return 'SC'; //
    }
    if (estado == 24) {
      return 'SP';
    }
    if (estado == 26) {
      return 'ES'; //
    }
    if (estado == 16) {
      return 'TO';
    }

    print(estado);
    return "";
  }

  List<String> UF = [
    "ARACAJU",
    "BELEM",
    "BELO HORIZONTE",
    "BOA VISTA",
    "BRASILIA",
    "CAMPO GRANDE",
    "CUIABA",
    "CURITIBA",
    "FLORIANOPOLIS",
    "FORTALEZA",
    "GOIANIA",
    "JOAO PESSOA",
    "MACAPA",
    "MACEIÓ",
    "MANAUS",
    "NATAL",
    "PALMAS",
    "PORTO ALEGRE",
    "PORTO VELHO",
    "RECIFE",
    "RIO BRANCO",
    "RIO DE JANEIRO",
    "SALVADOR",
    "SAO LUIS",
    "SAO PAULO",
    "TERESINA",
    "VITORIA",
  ];
  @action
  Future<bool> sincronizar_dados() async {
    setIsload(true);
    Lista_data_clima = ObservableList();
    for (var i = 0; i < UF.length; i++) {
      var url = 'https://teste-api-res.herokuapp.com/get_inmet?capital=' +
          UF[i]; //'https://apitempo.inmet.gov.br/condicao/capitais/2022-01-03'; //
      try {
        var response = await http.get(
          Uri.parse(url),
        );

        var res = json.decode(response.body);
        double aux = 0;
        double aux2 = 0;
        for (var j = res.length - 1; j > 60; j--) {
          aux2 = 0;
          aux2 += double.parse(res[j]['tmax'].replaceAll('*', ''));
          aux2 += double.parse(res[j]['tmin'].replaceAll('*', ''));
          aux = aux2 / 2;
        }
        Lista_data_clima.add(
            Media_clima(estado: verificaIndexEstado(i), media: aux));
        //print(DateTime.parse(res[i]['data']).month);

      } catch (e) {
        print('erro');
        return false;
      }
    }

    setIsload(false);
    for (var i = 0; i < Lista_data_clima.length; i++) {
      print("${Lista_data_clima[i].estado} - ${Lista_data_clima[i].media}");
    }
    return true;
  }
}

class Media_clima {
  String estado;
  double media;
  Media_clima({
    required this.estado,
    required this.media,
  });
}
