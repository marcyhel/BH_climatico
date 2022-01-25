import 'dart:math';

import 'package:get_it/get_it.dart';
import 'package:plat2/mobx/mob_dados.dart';

final Mob_Dados mob = GetIt.I<Mob_Dados>();
void calcular() {
  double media_i = 0;
  if (mob.latitude < -90 || mob.latitude > 90) {
    mob.x9 = 0.0;
  } else {
    mob.x9 = mob.latitude;
  }
  for (var i = 0; i < mob.Lista_data_clima_media.length; i++) {
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      mob.Lista_data_clima_media[i].nda = 1;
    } else {
      mob.Lista_data_clima_media[i].nda =
          mob.Lista_data_clima_media[i - 1].nda +
              mob.Lista_data_clima_media[i - 1].cont_dias;
    }
    //----------------------------------------------------------------------------------------------------------
    mob.Lista_data_clima_media[i].d = 23.45 *
        sin(((360 / 365) * (mob.Lista_data_clima_media[i].nda - 81)) *
            pi /
            180);
    //----------------------------------------------------------------------------------------------------------
    mob.Lista_data_clima_media[i].hn = acos(-tan((mob.x9) * (pi / 180)) *
            tan((mob.Lista_data_clima_media[i].d) * (pi / 180))) *
        (180 / pi);
    //----------------------------------------------------------------------------------------------------------
    mob.Lista_data_clima_media[i].n_horas =
        2 * mob.Lista_data_clima_media[i].hn / 15;
    //----------------------------------------------------------------------------------------------------------
    mob.Lista_data_clima_media[i].i =
        pow((0.2 * mob.Lista_data_clima_media[i].t), 1.514);

    media_i += mob.Lista_data_clima_media[i].i;
  }
  //----------------------------------------------------------------------------------------------------------
  media_i = media_i / mob.Lista_data_clima_media.length;
  mob.i = media_i * 12;
  //----------------------------------------------------------------------------------------------------------
  mob.a = 0.49 +
      0.018 * mob.i -
      7.7 * pow(10, -5) * pow(mob.i, 2) +
      6.75 * pow(10, -7) * pow(mob.i, 3);
  //----------------------------------------------------------------------------------------------------------

  for (var i = 0; i < mob.Lista_data_clima_media.length; i++) {
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].t < 26.5) {
      mob.Lista_data_clima_media[i].etp = 16 *
          pow(10 * mob.Lista_data_clima_media[i].t / mob.i, mob.a) *
          (mob.Lista_data_clima_media[i].cont_dias / 30) *
          (mob.Lista_data_clima_media[i].n_horas / 12);
    } else {
      mob.Lista_data_clima_media[i].etp = (-415.85 +
              32.24 * mob.Lista_data_clima_media[i].t -
              0.43 * pow(mob.Lista_data_clima_media[i].t, 2)) *
          (mob.Lista_data_clima_media[i].cont_dias / 30) *
          (mob.Lista_data_clima_media[i].n_horas / 12);
    }
    //----------------------------------------------------------------------------------------------------------
    mob.Lista_data_clima_media[i].p_etp =
        mob.Lista_data_clima_media[i].p - mob.Lista_data_clima_media[i].etp;
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].p_etp >= 0) {
      mob.Lista_data_clima_media[i].mais = mob.Lista_data_clima_media[i].p_etp;
    } else {
      mob.Lista_data_clima_media[i].mais = 0;
    }
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].p_etp < 0) {
      mob.Lista_data_clima_media[i].menos = mob.Lista_data_clima_media[i].p_etp;
    } else {
      mob.Lista_data_clima_media[i].menos = 0;
    }
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].p_etp > 0) {
      mob.Lista_data_clima_media[i].status1 =
          mob.Lista_data_clima_media[i].p_etp;
    } else {
      mob.Lista_data_clima_media[i].status1 = 0;
    }
  }
  //----------------------------------------------------------------------------------------------------------
  for (var i = 0; i < mob.Lista_data_clima_media.length; i++) {
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].p_etp > 0) {
      mob.Lista_data_clima_media[i].status2 = mob
              .Lista_data_clima_media[mob.Lista_data_clima_media.length - 1]
              .status1 +
          mob.Lista_data_clima_media.length;
    } else {
      mob.Lista_data_clima_media[i].status2 = 0;
    }
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].p_etp > 0) {
      mob.Lista_data_clima_media[i].status12 = mob
              .Lista_data_clima_media[mob.Lista_data_clima_media.length - 1]
              .status1 +
          mob.Lista_data_clima_media[i].p_etp;
    } else {
      mob.Lista_data_clima_media[i].status12 = mob
          .Lista_data_clima_media[mob.Lista_data_clima_media.length - 1]
          .status1;
    }
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].p_etp > 0) {
      mob.Lista_data_clima_media[i].status22 = mob
              .Lista_data_clima_media[mob.Lista_data_clima_media.length - 1]
              .status2 +
          mob.Lista_data_clima_media[i].p_etp;
    } else {
      mob.Lista_data_clima_media[i].status22 = mob
          .Lista_data_clima_media[mob.Lista_data_clima_media.length - 1]
          .status1;
    }
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].status1 >= double.parse(mob.cad)) {
      mob.Lista_data_clima_media[i].control1 = 1;
    } else {
      mob.Lista_data_clima_media[i].control1 = 0;
    }
    //----------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------

  }
  double maior_status2 = 0;
  double soma_control1 = 0;
  double soma_mais = 0;
  double soma_menos = 0;

  for (var i = 0; i < mob.Lista_data_clima_media.length; i++) {
    if (mob.Lista_data_clima_media[i].status2 > maior_status2) {
      maior_status2 = mob.Lista_data_clima_media[i].status2;
    }
    soma_control1 += mob.Lista_data_clima_media[i].control1;
    soma_mais += mob.Lista_data_clima_media[i].mais;
    soma_menos += mob.Lista_data_clima_media[i].menos;
  }
  mob.n = soma_menos / double.parse(mob.cad);
  mob.p = (soma_mais / double.parse(mob.cad)) + 0.0000000001;
  mob.en = 1 - exp(mob.n);
  //----------------------------------------------------------------------------------------------------------
  if (mob.p >= mob.en) {
    mob.neg_acum = 0;
  } else {
    mob.neg_acum = -(-log(mob.p / mob.en)) * double.parse(mob.cad);
  }
  //----------------------------------------------------------------------------------------------------------
  if (double.parse(mob.cad) > 0) {
    if (soma_control1 == 0) {
      mob.cz5 = 2;
    } else {
      mob.cz5 = 1;
    }
  } else {
    mob.cz5 = 0;
  }
  //----------------------------------------------------------------------------------------------------------
  for (var i = 0; i < mob.Lista_data_clima_media.length; i++) {
    if (mob.Lista_data_clima_media[i].status2 >= double.parse(mob.cad) ||
        mob.Lista_data_clima_media[i].status2 == maior_status2) {
      mob.Lista_data_clima_media[i].control2 = 1;
    } else {
      mob.Lista_data_clima_media[i].control2 = 0;
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      if (soma_control1 != 0) {
        if (mob.Lista_data_clima_media[i].control1 == 1) {
          mob.Lista_data_clima_media[i].inicio3 = 1;
        } else {
          mob.Lista_data_clima_media[i].inicio3 = 0;
        }
      } else {
        if (mob.Lista_data_clima_media[i].control2 == 1) {
          mob.Lista_data_clima_media[i].inicio3 = 1;
        } else {
          mob.Lista_data_clima_media[i].inicio3 = 0;
        }
      }
    } else {
      if (soma_control1 != 0) {
        if (mob.Lista_data_clima_media[i].control1 == 1 ||
            mob.Lista_data_clima_media[i - 1].inicio3 == 1) {
          mob.Lista_data_clima_media[i].inicio3 = 1;
        } else {
          mob.Lista_data_clima_media[i].inicio3 = 0;
        }
      } else {
        if (mob.Lista_data_clima_media[i].control2 == 1 ||
            mob.Lista_data_clima_media[i - 1].inicio3 == 1) {
          mob.Lista_data_clima_media[i].inicio3 = 1;
        } else {
          mob.Lista_data_clima_media[i].inicio3 = 0;
        }
      }
    }

    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      if (mob.Lista_data_clima_media[i].status1 >= double.parse(mob.cad)) {
        mob.Lista_data_clima_media[i].inicio2 = 1;
      } else {
        mob.Lista_data_clima_media[i].inicio2 = 0;
      }
    } else {
      if (mob.Lista_data_clima_media[i].status1 >= double.parse(mob.cad) ||
          mob.Lista_data_clima_media[i - 1].inicio2 == 1) {
        mob.Lista_data_clima_media[i].inicio2 = 1;
      } else {
        mob.Lista_data_clima_media[i].inicio2 = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      if (mob.Lista_data_clima_media[i].inicio3 == 1) {
        mob.Lista_data_clima_media[i].inicio = 1;
      } else {
        mob.Lista_data_clima_media[i].inicio = 0;
      }
    } else {
      if (i == 0) {
        if (mob.Lista_data_clima_media[i].inicio3 == 1 &&
            mob.Lista_data_clima_media[i - 1].inicio3 == 0) {
          mob.Lista_data_clima_media[i].inicio = 1;
        } else {
          mob.Lista_data_clima_media[i].inicio = 0;
        }
      }
    }
    //----------------------------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].inicio3 == 1) {
      if (mob.Lista_data_clima_media[i].arm_logico > double.parse(mob.cad)) {
        mob.Lista_data_clima_media[i].arm2 = double.parse(mob.cad);
      } else {
        mob.Lista_data_clima_media[i].arm2 =
            mob.Lista_data_clima_media[i].arm_logico;
      }
    } else {
      mob.Lista_data_clima_media[i].arm2 = 0;
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      if (mob.Lista_data_clima_media[i].inicio3 == 0) {
        mob.Lista_data_clima_media[i].neg_ac2 = 0;
      } else {
        if (soma_control1 == 0 && mob.Lista_data_clima_media[i].control2 != 0) {
          mob.Lista_data_clima_media[i].neg_ac2 = mob.neg_acum;
        } else {
          if (mob.Lista_data_clima_media[i].p_etp < 0) {
            mob.Lista_data_clima_media[i].neg_ac2 =
                0 + mob.Lista_data_clima_media[i].p_etp;
          } else {
            if (mob.Lista_data_clima_media[i].p_etp > 0) {
              mob.Lista_data_clima_media[i].neg_ac2 = double.parse(mob.cad) *
                  log(mob.Lista_data_clima_media[i].arm2 /
                      double.parse(mob.cad));
            }
          }
        }
      }
    } else {
      if (mob.Lista_data_clima_media[i].inicio3 == 0) {
        mob.Lista_data_clima_media[i].neg_ac2 = 0;
      } else {
        if (soma_control1 == 0 && mob.Lista_data_clima_media[i].control2 != 0) {
          mob.Lista_data_clima_media[i].neg_ac2 = mob.neg_acum;
        } else {
          if (mob.Lista_data_clima_media[i].p_etp < 0) {
            mob.Lista_data_clima_media[i].neg_ac2 =
                mob.Lista_data_clima_media[i - 1].neg_ac +
                    mob.Lista_data_clima_media[i].p_etp;
          } else {
            if (mob.Lista_data_clima_media[i].p_etp > 0) {
              mob.Lista_data_clima_media[i].neg_ac2 = double.parse(mob.cad) *
                  log(mob.Lista_data_clima_media[i].arm2 /
                      double.parse(mob.cad));
            }
          }
        }
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      if (mob.cz5 == 2 && mob.Lista_data_clima_media[i].inicio3 == 1) {
        mob.Lista_data_clima_media[i].alt2 =
            mob.Lista_data_clima_media[i].status2;
      } else {
        if (mob.Lista_data_clima_media[i].inicio3 == 1) {
          mob.Lista_data_clima_media[i].alt2 =
              mob.Lista_data_clima_media[i].arm2 - double.parse(mob.cad);
        } else {
          mob.Lista_data_clima_media[i].alt2 = 0;
        }
      }
    } else {
      if (mob.cz5 == 2 &&
          mob.Lista_data_clima_media[i].inicio3 == 1 &&
          mob.Lista_data_clima_media[i - 1].inicio3 == 0) {
        mob.Lista_data_clima_media[i].alt2 =
            mob.Lista_data_clima_media[i].status2;
      } else {
        if (mob.Lista_data_clima_media[i].inicio3 == 1) {
          mob.Lista_data_clima_media[i].alt2 =
              mob.Lista_data_clima_media[i].arm2 -
                  mob.Lista_data_clima_media[i - 1].arm2;
        } else {
          mob.Lista_data_clima_media[i].alt2 = 0;
        }
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].inicio3 == 1) {
      if (mob.Lista_data_clima_media[i].p_etp >= 0) {
        mob.Lista_data_clima_media[i].etr2 = mob.Lista_data_clima_media[i].etp;
      } else {
        if (mob.Lista_data_clima_media[i].alt2 < 0) {
          mob.Lista_data_clima_media[i].etr = mob.Lista_data_clima_media[i].p +
              (mob.Lista_data_clima_media[i].alt.abs());
        } else {
          mob.Lista_data_clima_media[i].etr2 =
              mob.Lista_data_clima_media[i].etp;
        }
      }
    } else {
      mob.Lista_data_clima_media[i].etr2 = 0;
    }
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].inicio3 == 1) {
      mob.Lista_data_clima_media[i].def2 = mob.Lista_data_clima_media[i].etp -
          mob.Lista_data_clima_media[i].etr2;
    } else {
      mob.Lista_data_clima_media[i].def2 = 0;
    }
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].inicio3 == 1) {
      if (mob.Lista_data_clima_media[i].arm2 < double.parse(mob.cad)) {
        mob.Lista_data_clima_media[i].exc2 = 0;
      } else {
        if (mob.Lista_data_clima_media[i].arm2 == double.parse(mob.cad)) {
          mob.Lista_data_clima_media[i].exc2 =
              mob.Lista_data_clima_media[i].p_etp;
        } else {
          mob.Lista_data_clima_media[i].exc2 =
              mob.Lista_data_clima_media[i].p_etp -
                  mob.Lista_data_clima_media[i].alt2;
        }
      }
    } else {
      mob.Lista_data_clima_media[i].exc2 = 0;
    }
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].status1 >= double.parse(mob.cad) ||
        soma_control1 == 1) {
      mob.Lista_data_clima_media[i].control12 = 1;
    } else {
      mob.Lista_data_clima_media[i].control12 = 0;
    }
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].status1 == maior_status2) {
      mob.Lista_data_clima_media[i].control22 = 1;
    } else {
      mob.Lista_data_clima_media[i].control22 = 0;
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      if (soma_control1 != 0) {
        if (mob.Lista_data_clima_media[i].control12 == 1 ||
            mob.Lista_data_clima_media[mob.Lista_data_clima_media.length - 1]
                    .inicio3 ==
                1) {
          mob.Lista_data_clima_media[i].control32 = 1;
        } else {
          mob.Lista_data_clima_media[i].control32 = 0;
        }
      } else {
        if (mob.Lista_data_clima_media[i].control22 == 1 ||
            mob.Lista_data_clima_media[mob.Lista_data_clima_media.length - 1]
                    .inicio3 ==
                1) {
          mob.Lista_data_clima_media[i].control32 = 1;
        } else {
          mob.Lista_data_clima_media[i].control32 = 0;
        }
      }
    } else {
      if (soma_control1 != 0) {
        if (mob.Lista_data_clima_media[i].control12 == 1 ||
            mob.Lista_data_clima_media[i - 1].control32 == 1) {
          mob.Lista_data_clima_media[i].control32 = 1;
        } else {
          mob.Lista_data_clima_media[i].control32 = 0;
        }
      } else {
        if (mob.Lista_data_clima_media[i].control22 == 1 ||
            mob.Lista_data_clima_media[i - 1].control32 == 1) {
          mob.Lista_data_clima_media[i].control32 = 1;
        } else {
          mob.Lista_data_clima_media[i].control32 = 0;
        }
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].inicio == 0) {
      mob.Lista_data_clima_media[i].arm_logico2 = 0;
    } else {
      if (soma_control1 != 0) {
        if (mob.Lista_data_clima_media[i].status1 > double.parse(mob.cad)) {
          mob.Lista_data_clima_media[i].arm_logico2 = double.parse(mob.cad);
        } else {
          mob.Lista_data_clima_media[i].arm_logico2 =
              mob.Lista_data_clima_media[i].statuts1;
        }
      } else {
        if (mob.Lista_data_clima_media[i].status2 > double.parse(mob.cad)) {
          mob.Lista_data_clima_media[i].arm_logico2 = double.parse(mob.cad);
        } else {
          mob.Lista_data_clima_media[i].arm_logico2 = double.parse(mob.cad) *
              exp(mob.Lista_data_clima_media[i].neg_ac2 /
                  double.parse(mob.cad));
        }
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      if (mob.Lista_data_clima_media[i].inicio3 == 0) {
        mob.Lista_data_clima_media[i].arm_logico = 0;
      } else {
        if (mob.Lista_data_clima_media[i].arm_logico2 != 0) {
          mob.Lista_data_clima_media[i].arm_logico =
              mob.Lista_data_clima_media[i].arm_logico2;
        } else {
          if (mob.Lista_data_clima_media[i].p_etp < 0) {
            mob.Lista_data_clima_media[i].arm_logico = double.parse(mob.cad) *
                exp(mob.Lista_data_clima_media[i].neg_ac2 /
                    double.parse(mob.cad));
          } else {
            if (mob.Lista_data_clima_media[i].p_etp > 0) {
              mob.Lista_data_clima_media[i].arm_logico = double.parse(mob.cad) +
                  mob.Lista_data_clima_media[i].p_etp.abs();
            }
          }
        }
      }
    } else {
      if (mob.Lista_data_clima_media[i].inicio3 == 0) {
        mob.Lista_data_clima_media[i].arm_logico = 0;
      } else {
        if (mob.Lista_data_clima_media[i].arm_logico2 != 0) {
          mob.Lista_data_clima_media[i].arm_logico =
              mob.Lista_data_clima_media[i].arm_logico2;
        } else {
          if (mob.Lista_data_clima_media[i].p_etp < 0) {
            mob.Lista_data_clima_media[i].arm_logico = double.parse(mob.cad) *
                exp(mob.Lista_data_clima_media[i].neg_ac2 /
                    double.parse(mob.cad));
          } else {
            if (mob.Lista_data_clima_media[i].p_etp > 0) {
              mob.Lista_data_clima_media[i].arm_logico =
                  mob.Lista_data_clima_media[i - 1].arm_logico +
                      mob.Lista_data_clima_media[i].p_etp.abs();
            }
          }
        }
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].control32 == 1) {
      if (mob.Lista_data_clima_media[i].status32 > double.parse(mob.cad)) {
        mob.Lista_data_clima_media[i].arm = double.parse(mob.cad);
      } else {
        mob.Lista_data_clima_media[i].arm =
            mob.Lista_data_clima_media[i].status32;
      }
    } else {
      mob.Lista_data_clima_media[i].arm = 0;
    }

    //----------------------------------------------------------------------------------------------------------
  }
  //----------------------------------------------------------------------------------------------------------
  for (var i = 0; i < mob.Lista_data_clima_media.length; i++) {
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      if (mob.Lista_data_clima_media[i].control32 == 0) {
        mob.Lista_data_clima_media[i].neg_ac = 0;
      } else if (mob.Lista_data_clima_media[i].p_etp < 0) {
        print(
            "neg = ${mob.Lista_data_clima_media[mob.Lista_data_clima_media.length - 1].neg_ac2}");
        print("p_atp = ${mob.Lista_data_clima_media[i].p_etp}");
        print(
            "soma = ${mob.Lista_data_clima_media[i].neg_ac = mob.Lista_data_clima_media[mob.Lista_data_clima_media.length - 1].neg_ac2 + mob.Lista_data_clima_media[i].p_etp}");
        mob.Lista_data_clima_media[i].neg_ac = mob
                .Lista_data_clima_media[mob.Lista_data_clima_media.length - 1]
                .neg_ac2 +
            mob.Lista_data_clima_media[i].p_etp;
      } else if (mob.Lista_data_clima_media[i].p_etp >= 0) {
        mob.Lista_data_clima_media[i].neg_ac = double.parse(mob.cad) *
            log(mob.Lista_data_clima_media[i].arm / double.parse(mob.cad));
      }
    } else {
      if (mob.Lista_data_clima_media[i].control32 == 0) {
        mob.Lista_data_clima_media[i].neg_ac = 0;
      } else if (mob.Lista_data_clima_media[i].p_etp < 0) {
        mob.Lista_data_clima_media[i].neg_ac =
            mob.Lista_data_clima_media[i - 1].neg_ac +
                mob.Lista_data_clima_media[i].p_etp;
      } else if (mob.Lista_data_clima_media[i].p_etp >= 0) {
        mob.Lista_data_clima_media[i].neg_ac = double.parse(mob.cad) *
            log(mob.Lista_data_clima_media[i].arm / double.parse(mob.cad));
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      if (mob.cz5 == 2 &&
          mob.Lista_data_clima_media[i].control32 == 1 &&
          mob.Lista_data_clima_media[i].inicio3 == 0) {
        mob.Lista_data_clima_media[i].alt =
            mob.Lista_data_clima_media[i].status2;
      } else if (mob.Lista_data_clima_media[i].control32 == 1) {
        mob.Lista_data_clima_media[i].alt = mob.Lista_data_clima_media[i].arm -
            mob.Lista_data_clima_media[mob.Lista_data_clima_media.length - 1]
                .arm2;
      } else {
        mob.Lista_data_clima_media[i].alt = 0;
      }
    } else {
      if (mob.cz5 == 2 &&
          mob.Lista_data_clima_media[i].control32 == 1 &&
          mob.Lista_data_clima_media[i].control32 == 0) {
        mob.Lista_data_clima_media[i].alt =
            mob.Lista_data_clima_media[i].status2;
      } else if (mob.Lista_data_clima_media[i].control32 == 1) {
        mob.Lista_data_clima_media[i].alt = mob.Lista_data_clima_media[i].arm -
            mob.Lista_data_clima_media[i - 1].arm;
      } else {
        mob.Lista_data_clima_media[i].alt = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].control32 == 1) {
      if (mob.Lista_data_clima_media[i].p_etp >= 0) {
        mob.Lista_data_clima_media[i].etr = mob.Lista_data_clima_media[i].etp;
      } else if (mob.Lista_data_clima_media[i].alt < 0) {
        mob.Lista_data_clima_media[i].etr = mob.Lista_data_clima_media[i].p +
            mob.Lista_data_clima_media[i].alt.abs();
      } else {
        mob.Lista_data_clima_media[i].etr = mob.Lista_data_clima_media[i].etp;
      }
    } else {
      mob.Lista_data_clima_media[i].etr = 0;
    }
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].control32 == 1) {
      mob.Lista_data_clima_media[i].def =
          mob.Lista_data_clima_media[i].etp - mob.Lista_data_clima_media[i].etr;
    } else {
      mob.Lista_data_clima_media[i].def == 0;
    }
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].control32 == 1) {
      if (mob.Lista_data_clima_media[i].arm < double.parse(mob.cad)) {
        mob.Lista_data_clima_media[i].exc = 0;
      } else if (mob.Lista_data_clima_media[i].arm == double.parse(mob.cad)) {
        mob.Lista_data_clima_media[i].exc =
            mob.Lista_data_clima_media[i].p_etp -
                mob.Lista_data_clima_media[i].alt;
      }
    } else {
      mob.Lista_data_clima_media[i].exc = 0;
    }
    //----------------------------------------------------------------------------------------------------------

  }
  for (var i = 0; i < mob.Lista_data_clima_media.length; i++) {
    mob.total_p += mob.Lista_data_clima_media[i].p;
    mob.total_t += mob.Lista_data_clima_media[i].t;
    mob.total_etp += mob.Lista_data_clima_media[i].etp;
    mob.total_p_etp += mob.Lista_data_clima_media[i].p_etp;
    mob.total_alt += mob.Lista_data_clima_media[i].alt;
    mob.total_etr += mob.Lista_data_clima_media[i].etr;
    mob.total_def += mob.Lista_data_clima_media[i].def;
    mob.total_exc += mob.Lista_data_clima_media[i].exc;
  }
  mob.media_p = mob.total_p / mob.Lista_data_clima_media.length;
  mob.media_t = mob.total_t / mob.Lista_data_clima_media.length;
  mob.media_etp = mob.total_etp / mob.Lista_data_clima_media.length;
  mob.media_p_etp = mob.total_p_etp / mob.Lista_data_clima_media.length;
  mob.media_alt = mob.total_alt / mob.Lista_data_clima_media.length;
  mob.media_etr = mob.total_etr / mob.Lista_data_clima_media.length;
  mob.media_def = mob.total_def / mob.Lista_data_clima_media.length;
  mob.media_exc = mob.total_exc / mob.Lista_data_clima_media.length;
  print(mob.total_p);
  print(mob.media_p);
}
