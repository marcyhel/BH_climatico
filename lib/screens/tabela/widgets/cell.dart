import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:plat2/mobx/mob_dados.dart';

final Mob_Dados mob = GetIt.I<Mob_Dados>();
enum Estados { Estab, Des_Veg, Floresc, Frutif, Maturac, Vazio }

class Cell extends StatelessWidget {
  int i;
  int j;
  int resultado = 0;
  int precisao = 2;
  Cell({
    Key? key,
    required this.i,
    required this.j,
  }) : super(key: key);
  String veri(i, j) {
    if (j == 0) {
      return mob.Lista_data_clima_media[i].mes;
    } else if (j == 1) {
      return mob.Lista_data_clima_media[i].cont_dias.toString();
    } else if (j == 2) {
      return mob.Lista_data_clima_media[i].nda.toStringAsFixed(precisao);
    } else if (j == 3) {
      return mob.Lista_data_clima_media[i].t.toStringAsFixed(precisao);
    } else if (j == 4) {
      return mob.Lista_data_clima_media[i].p.toStringAsFixed(precisao);
    } else if (j == 5) {
      return mob.Lista_data_clima_media[i].n_horas.toStringAsFixed(precisao);
    } else if (j == 6) {
      return mob.Lista_data_clima_media[i].i.toStringAsFixed(precisao);
    } else if (j == 7) {
      return mob.Lista_data_clima_media[i].etp.toStringAsFixed(precisao);
    } else if (j == 8) {
      return mob.Lista_data_clima_media[i].p_etp.toStringAsFixed(precisao);
    } else if (j == 9) {
      return mob.Lista_data_clima_media[i].neg_ac.toStringAsFixed(precisao);
    } else if (j == 10) {
      return mob.Lista_data_clima_media[i].arm.toStringAsFixed(precisao);
    } else if (j == 11) {
      return mob.Lista_data_clima_media[i].alt.toStringAsFixed(precisao);
    } else if (j == 12) {
      return mob.Lista_data_clima_media[i].etr.toStringAsFixed(precisao);
    } else if (j == 13) {
      return mob.Lista_data_clima_media[i].def.toStringAsFixed(precisao);
    } else if (j == 14) {
      return mob.Lista_data_clima_media[i].exc.toStringAsFixed(precisao);
    } else if (j == 15) {
      return mob.Lista_data_clima_media[i].d.toStringAsFixed(precisao);
    } else if (j == 16) {
      return mob.Lista_data_clima_media[i].hn.toStringAsFixed(precisao);
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(veri(i, j)),
    );
  }
}
