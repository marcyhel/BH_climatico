// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import 'package:plat2/mobx/models/calculo.dart';

import 'models/model_dados_tabela.dart';

part 'mob_dados.g.dart';

class Mob_Dados = _Mob_DadosBase with _$Mob_Dados;

abstract class _Mob_DadosBase with Store {
  Box box;
  _Mob_DadosBase(
    this.box,
  );
  @action
  bool calcula() {
    try {
      calcular();
    } catch (e) {
      return false;
    }
    return true;
  }

  @action
  Future<bool> sincronizar_dados() async {
    setIsload(true);
    Lista_data_clima = ObservableList();

    var url = 'https://teste-api-res.herokuapp.com/get_inmet?capital=' +
        estado; //'https://apitempo.inmet.gov.br/condicao/capitais/2022-01-03'; //
    try {
      var response = await http.get(
        Uri.parse(url),
      );

      var res = json.decode(response.body);

      var mesatual = DateTime.parse(res[res.length - 1]['data']).month;
      var contmes = 0;
      var chavemes = 0;

      for (var i = res.length - 1; i > 345; i--) {
        if (mesatual != DateTime.parse(res[i]['data']).month) {
          contmes = 1;
        }
        if (mesatual != DateTime.parse(res[i]['data']).month || contmes != 0) {
          Lista_data_clima.add(DataClimaNow(
              res[i]['tmax'].replaceAll('*', ''),
              res[i]['tmin'].replaceAll('*', ''),
              res[i]['pmax'].replaceAll('*', ''),
              res[i]['data']));
        }

        //print(DateTime.parse(res[i]['data']).month);
      }
    } catch (e) {
      print('erro');
      return false;
    }
    setIsload(false);
    media_lista_clima();
    return true;
  }

  void media_lista_clima() {
    //Lista_data_clima_media = [];
    Lista_data_clima_media = ObservableList();
    var mes = DateTime.parse(Lista_data_clima[0].data).month;
    var mediap = 0.0;
    var mediat = 0.0;
    var mediatmin = 0.0;
    var cont_dias = 0;
    for (var i = 0; i < Lista_data_clima.length; i++) {
      if (DateTime.parse(Lista_data_clima[i].data).month != mes) {
        mediat = (mediat + mediatmin) / 2;
        if (cont_dias < 27) {
          mediap = mediap / 30;
          mediat = mediat / 30;
        } else {
          mediap = mediap / cont_dias;
          mediat = mediat / cont_dias;
        }

        Lista_data_clima_media.add(DataClimaMedia(
            cont_dias,
            mediat,
            mediap,
            def_mes(mes),
            DateTime.parse(Lista_data_clima[i - 1].data).year.toString()));
        cont_dias = 0;
        mes = DateTime.parse(Lista_data_clima[i].data).month;
        mediap = 0;
        mediat = 0;
        mediatmin = 0;
      }
      cont_dias++;
      mediap += double.parse(Lista_data_clima[i].p);
      mediat += double.parse(Lista_data_clima[i].t);
      mediatmin += double.parse(Lista_data_clima[i].tmin);
    }
    print(Lista_data_clima[0].data);
    print(Lista_data_clima[Lista_data_clima.length - 1].data);
    Lista_data_clima_media.forEach((e) {
      print(e.mes);
      print(e.cont_dias);
    });
  }

  @action
  String def_mes(int valor) {
    if (valor == 01) {
      return "jan";
    }
    if (valor == 02) {
      return "fev";
    }
    if (valor == 03) {
      return "mar";
    }
    if (valor == 04) {
      return "abr";
    }
    if (valor == 05) {
      return "mai";
    }
    if (valor == 06) {
      return "jun";
    }
    if (valor == 07) {
      return "jul";
    }
    if (valor == 08) {
      return "ago";
    }
    if (valor == 09) {
      return "set";
    }
    if (valor == 10) {
      return "out";
    }
    if (valor == 11) {
      return "nov";
    }
    if (valor == 12) {
      return "dez";
    }
    return "-";
  }

  @observable
  ObservableList Lista_data_clima = ObservableList();
  @observable
  ObservableList Lista_data_clima_media = ObservableList();
  @observable
  String estado = '';
  @observable
  String cad = '';
  @observable
  String nda_inicial = '';
  @observable
  double latitude = 20.83;
  @observable
  double x9 = 0;
  @observable
  double i = 0;
  @observable
  double a = 0;
  @observable
  double n = 0;
  @observable
  double p = 0;
  @observable
  double en = 0;
  @observable
  double neg_acum = 0;
  @observable
  double cz5 = 0;
  @observable
  double total_t = 0;
  @observable
  double media_t = 0;
  @observable
  double total_p = 0;
  @observable
  double media_p = 0;
  @observable
  double total_etp = 0;
  @observable
  double media_etp = 0;
  @observable
  double total_p_etp = 0;
  @observable
  double media_p_etp = 0;
  @observable
  double total_alt = 0;
  @observable
  double media_alt = 0;
  @observable
  double total_etr = 0;
  @observable
  double media_etr = 0;
  @observable
  double total_def = 0;
  @observable
  double media_def = 0;
  @observable
  double total_exc = 0;
  @observable
  double media_exc = 0;

  @observable
  bool bool_cad = false;
  @observable
  bool bool_nda_inicial = false;

  @action
  void setCad(valor) => cad = valor;
  @action
  void setNda_inicial(valor) => nda_inicial = valor;

  @action
  void setEstado(valor) => estado = valor;
  @observable
  bool isLoad = false;
  @action
  void setIsload(valor) => isLoad = valor;
}

class DataClima {
  DateTime dataStrat = DateTime.now();
  DateTime dataEnd = DateTime.now();

  double t = 0;
  double p = 0;

  DataClima({
    this.t = 0,
    this.p = 0,
  });
}

class DataClimaNow {
  String data = 'DateTime.now()';

  String t = '0';
  String p = '0';
  String tmin = '0';
  DataClimaNow(
    this.t,
    this.tmin,
    this.p,
    this.data,
  ) {}
}
