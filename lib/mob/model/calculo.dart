import 'dart:math';

import 'package:bh_sequencial/mob/State/mob_state.dart';
import 'package:get_it/get_it.dart';

final Mob_State mob = GetIt.I<Mob_State>();
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
    } else if (mob.Lista_data_clima_media[i].mes == 'jan') {
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

  //----------------------------------------------------------------------------------------------------------
  for (var i = 0; i < mob.Lista_data_clima_media.length; i++) {
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].t < 26.5) {
      mob.Lista_data_clima_media[i].etp = 16 *
          pow(10 * mob.Lista_data_clima_media[i].t / double.parse(mob.i),
              double.parse(mob.a)) *
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

    if (mob.Lista_data_clima_media[i].p_etp < 0) {
      mob.Lista_data_clima_media[i].contr1 = 1;
    } else {
      mob.Lista_data_clima_media[i].contr1 = 0;
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      mob.Lista_data_clima_media[i].contr2 = 0;
    } else {
      if (mob.Lista_data_clima_media[i - 1].contr1 == 1 &&
          mob.Lista_data_clima_media[i].contr1 == 0) {
        mob.Lista_data_clima_media[i].contr2 = 1;
      } else {
        mob.Lista_data_clima_media[i].contr2 = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      mob.Lista_data_clima_media[i].contr3 = 0;
    } else {
      if (mob.Lista_data_clima_media[i - 1].contr2 == 1 &&
          mob.Lista_data_clima_media[i].contr2 == 0) {
        mob.Lista_data_clima_media[i].contr3 = 1;
      } else {
        mob.Lista_data_clima_media[i].contr3 = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      mob.Lista_data_clima_media[i].contr4 = 0;
    } else {
      if (mob.Lista_data_clima_media[i - 1].contr3 == 1 &&
          mob.Lista_data_clima_media[i].contr3 == 0) {
        mob.Lista_data_clima_media[i].contr4 = 1;
      } else {
        mob.Lista_data_clima_media[i].contr4 = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      mob.Lista_data_clima_media[i].contr5 = 0;
    } else {
      if (mob.Lista_data_clima_media[i - 1].contr4 == 1 &&
          mob.Lista_data_clima_media[i].contr4 == 0) {
        mob.Lista_data_clima_media[i].contr5 = 1;
      } else {
        mob.Lista_data_clima_media[i].contr5 = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      mob.Lista_data_clima_media[i].contr6 = 0;
    } else {
      if (mob.Lista_data_clima_media[i - 1].contr5 == 1 &&
          mob.Lista_data_clima_media[i].contr5 == 0) {
        mob.Lista_data_clima_media[i].contr6 = 1;
      } else {
        mob.Lista_data_clima_media[i].contr6 = 0;
      }
    }

    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      mob.Lista_data_clima_media[i].contr7 = 0;
    } else {
      if (mob.Lista_data_clima_media[i - 1].contr6 == 1 &&
          mob.Lista_data_clima_media[i].contr6 == 0) {
        mob.Lista_data_clima_media[i].contr7 = 1;
      } else {
        mob.Lista_data_clima_media[i].contr7 = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      mob.Lista_data_clima_media[i].contr8 = 0;
    } else {
      if (mob.Lista_data_clima_media[i - 1].contr7 == 1 &&
          mob.Lista_data_clima_media[i].contr7 == 0) {
        mob.Lista_data_clima_media[i].contr8 = 1;
      } else {
        mob.Lista_data_clima_media[i].contr8 = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      mob.Lista_data_clima_media[i].contr9 = 0;
    } else {
      if (mob.Lista_data_clima_media[i - 1].contr8 == 1 &&
          mob.Lista_data_clima_media[i].contr8 == 0) {
        mob.Lista_data_clima_media[i].contr9 = 1;
      } else {
        mob.Lista_data_clima_media[i].contr9 = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      mob.Lista_data_clima_media[i].contr10 = 0;
    } else {
      if (mob.Lista_data_clima_media[i - 1].contr9 == 1 &&
          mob.Lista_data_clima_media[i].contr9 == 0) {
        mob.Lista_data_clima_media[i].contr10 = 1;
      } else {
        mob.Lista_data_clima_media[i].contr10 = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      mob.Lista_data_clima_media[i].contr11 = 0;
    } else {
      if (mob.Lista_data_clima_media[i - 1].contr10 == 1 &&
          mob.Lista_data_clima_media[i].contr10 == 0) {
        mob.Lista_data_clima_media[i].contr11 = 1;
      } else {
        mob.Lista_data_clima_media[i].contr11 = 0;
      }
    }

    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      mob.Lista_data_clima_media[i].contr12 = 0;
    } else {
      if (mob.Lista_data_clima_media[i - 1].contr11 == 1 &&
          mob.Lista_data_clima_media[i].contr11 == 0) {
        mob.Lista_data_clima_media[i].contr12 = 1;
      } else {
        mob.Lista_data_clima_media[i].contr12 = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      mob.Lista_data_clima_media[i].etp_com2 = 1;
    } else {
      if (mob.Lista_data_clima_media[i - 1].etp_com2 == 0) {
        mob.Lista_data_clima_media[i].etp_com2 = 0;
      } else {
        mob.Lista_data_clima_media[i].etp_com2 = 1;
      }
    }

    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      if (mob.Lista_data_clima_media[i].p_etp < 0) {
        mob.Lista_data_clima_media[i].etp_ncom = 0;
      } else {
        mob.Lista_data_clima_media[i].etp_ncom =
            mob.Lista_data_clima_media[i].p_etp;
      }
    } else {
      if (mob.Lista_data_clima_media[i].etp_com2 == 1) {
        if (mob.Lista_data_clima_media[i].p_etp < 0) {
          mob.Lista_data_clima_media[i].etp_ncom =
              mob.Lista_data_clima_media[i].p_etp +
                  mob.Lista_data_clima_media[i - 1].etp_ncom;
        }
      } else {
        mob.Lista_data_clima_media[i].etp_ncom = -1;
      }
    }

    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      if (mob.Lista_data_clima_media[i].p_etp < 0) {
        mob.Lista_data_clima_media[i].etp_com = 0;
      } else {
        mob.Lista_data_clima_media[i].etp_com =
            mob.Lista_data_clima_media[i].p_etp;
      }
    } else {
      if (mob.Lista_data_clima_media[i].etp_com2 == 1) {
        if (mob.Lista_data_clima_media[i].p_etp < 0) {
          mob.Lista_data_clima_media[i].etp_com =
              mob.Lista_data_clima_media[i - 1].etp_com;
        } else {
          mob.Lista_data_clima_media[i].etp_com =
              mob.Lista_data_clima_media[i].p_etp +
                  mob.Lista_data_clima_media[i - 1].etp_com;
        }
      }
    }
  }
  //----------------------------------------------------------------------------------------------------------
  double maior1 = 0;
  double maior2 = 0;
  for (var i = 0; i < mob.Lista_data_clima_media.length; i++) {
    if (mob.Lista_data_clima_media[i].etp_com > maior2) {
      maior2 = mob.Lista_data_clima_media[i].etp_com;
    }
    if (mob.Lista_data_clima_media[i].etp_ncom > maior1) {
      maior1 = mob.Lista_data_clima_media[i].etp_ncom;
    }
  }
  mob.maior_etp_com = maior2;
  mob.maior_etp_ncom = maior1;
  //----------------------------------------------------------------------------------------------------------
  if (double.parse(mob.cad) < 0) {
    mob.cq10 = -double.parse(mob.cad);
  } else {
    mob.cq10 = double.parse(mob.cad);
  }
  //----------------------------------------------------------------------------------------------------------
  if (mob.maior_etp_com < mob.cq10) {
    mob.maior_etp_com2 = 1;
  } else {
    mob.maior_etp_com2 = 0;
  }
  //----------------------------------------------------------------------------------------------------------
  for (var i = 0; i < mob.Lista_data_clima_media.length; i++) {
    if (i == 0) {
      if (mob.maior_etp_com2 == 1 &&
          (mob.Lista_data_clima_media[i].etp_ncom == mob.maior_etp_ncom ||
              0 == 1)) {
        mob.Lista_data_clima_media[i].co1 = 1;
      } else {
        mob.Lista_data_clima_media[i].co1 = 0;
      }
    } else {
      if (mob.maior_etp_com2 == 1 &&
          (mob.Lista_data_clima_media[i].etp_ncom == mob.maior_etp_ncom ||
              mob.Lista_data_clima_media[i - 1].co1 == 1)) {
        mob.Lista_data_clima_media[i].co1 = 1;
      } else {
        mob.Lista_data_clima_media[i].co1 = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      mob.Lista_data_clima_media[i].vlr1 = 0;
    } else {
      if (mob.Lista_data_clima_media[i].co1 == 1 &&
          mob.Lista_data_clima_media[i - 1].co1) {
        mob.Lista_data_clima_media[i].vlr1 =
            mob.Lista_data_clima_media[i].p_etp;
      } else {
        mob.Lista_data_clima_media[i].vlr1 = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------
    mob.soma_vlr1 += mob.Lista_data_clima_media[i].vlr1;
    //----------------------------------------------------------------------------------------------------------

    if ((mob.Lista_data_clima_media[i].contr1 == 1 ||
        mob.Lista_data_clima_media[i].contr2 == 1 ||
        mob.Lista_data_clima_media[i].contr3 == 1 ||
        mob.Lista_data_clima_media[i].contr4 == 1 ||
        mob.Lista_data_clima_media[i].contr5 == 1 ||
        mob.Lista_data_clima_media[i].contr6 == 1 ||
        mob.Lista_data_clima_media[i].contr7 == 1 ||
        mob.Lista_data_clima_media[i].contr8 == 1 ||
        mob.Lista_data_clima_media[i].contr9 == 1 ||
        mob.Lista_data_clima_media[i].contr10 == 1 ||
        mob.Lista_data_clima_media[i].contr11 == 1 ||
        mob.Lista_data_clima_media[i].contr12 == 1)) {
      mob.Lista_data_clima_media[i].vlr2 = 1;
    } else {
      mob.Lista_data_clima_media[i].vlr2 = 0;
    }
  }
  //----------------------------------------------------------------------------------------------------------
  mob.co = 0;
  //----------------------------------------------------------------------------------------------------------
  if (mob.co < 0) {
    mob.cq = 1;
  } else {
    mob.cq = 0;
  }
  //----------------------------------------------------------------------------------------------------------
  for (var i = 0; i < mob.Lista_data_clima_media.length; i++) {
    if (i == 0) {
      if (mob.Lista_data_clima_media[i].etp_com2 == 1) {
        if (mob.Lista_data_clima_media[i].p_etp > 0) {
          if (mob.Lista_data_clima_media[i].p_etp > double.parse(mob.cad)) {
            mob.Lista_data_clima_media[i].arm = double.parse(mob.cad);
          } else {
            mob.Lista_data_clima_media[i].arm =
                mob.Lista_data_clima_media[i].p_etp;
          }
        } else {
          if (mob.Lista_data_clima_media[i].arm_logico >
              double.parse(mob.cad)) {
            mob.Lista_data_clima_media[i].arm = double.parse(mob.cad);
          } else {
            mob.Lista_data_clima_media[i].arm =
                mob.Lista_data_clima_media[i].arm_logico;
          }
        }
      } else {
        mob.Lista_data_clima_media[i].arm = 0;
      }
    } else {
      if (mob.Lista_data_clima_media[i].etp_com2 == 1) {
        if (mob.Lista_data_clima_media[i].arm_logico > double.parse(mob.cad)) {
          mob.Lista_data_clima_media[i].arm = double.parse(mob.cad);
        } else {
          mob.Lista_data_clima_media[i].arm =
              mob.Lista_data_clima_media[i].arm_logico;
        }
      } else {
        mob.Lista_data_clima_media[i].arm = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      if (mob.Lista_data_clima_media[i].etp_com2 == 1) {
        if (mob.Lista_data_clima_media[i].vlr2 == 0) {
          mob.Lista_data_clima_media[i].neg_ac = 0;
        } else {
          if (mob.Lista_data_clima_media[i].p_etp < 0) {
            mob.Lista_data_clima_media[i].neg_ac =
                mob.Lista_data_clima_media[i].p_etp;
          } else {
            if (mob.Lista_data_clima_media[i].p_atp >= 0) {
              mob.Lista_data_clima_media[i].neg_ac = double.parse(mob.cad) *
                  log(mob.Lista_data_clima_media[i].arm /
                      double.parse(mob.cad));
            } else {
              mob.Lista_data_clima_media[i].neg_ac = 0;
            }
          }
        }
      } else {
        mob.Lista_data_clima_media[i].neg_ac = 0;
      }
    } else {
      if (mob.Lista_data_clima_media[i].etp_com2 == 1) {
        if (mob.Lista_data_clima_media[i].vlr2 == 0) {
          mob.Lista_data_clima_media[i].neg_ac = 0;
        } else {
          if (mob.Lista_data_clima_media[i].p_etp < 0) {
            mob.Lista_data_clima_media[i].neg_ac =
                mob.Lista_data_clima_media[i].p_etp +
                    mob.Lista_data_clima_media[i - 1].neg_ac;
          } else {
            if (mob.Lista_data_clima_media[i].p_atp >= 0) {
              mob.Lista_data_clima_media[i].neg_ac = double.parse(mob.cad) *
                  log(mob.Lista_data_clima_media[i].arm /
                      double.parse(mob.cad));
            } else {
              mob.Lista_data_clima_media[i].neg_ac = 0;
            }
          }
        }
      } else {
        mob.Lista_data_clima_media[i].neg_ac = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      mob.Lista_data_clima_media[i].arm_logico = 0;
    } else {
      if (mob.Lista_data_clima_media[i].estp_com2 == 1) {
        if (mob.Lista_data_clima_media[i].vlr2 == 0) {
          if (mob.maior_etp_com2 == 1) {
            mob.Lista_data_clima_media[i].arm_logico = mob.soma_vlr1;
          } else {
            mob.Lista_data_clima_media[i].arm_logico = double.parse(mob.cad);
          }
        } else {
          if (mob.Lista_data_clima_media[i].p_etp < 0) {
            mob.Lista_data_clima_media[i].arm_logico = exp(
                mob.Lista_data_clima_media[i].neg_ac / double.parse(mob.cad));
          } else {
            if (mob.Lista_data_clima_media[i].p_etp > 0) {
              mob.Lista_data_clima_media[i].arm_logico =
                  mob.Lista_data_clima_media[i - 1].arm_logico +
                      mob.Lista_data_clima_media[i].p_etp.abs();
            }
          }
        }
      } else {
        mob.Lista_data_clima_media[i].arm_logico = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      if (mob.Lista_data_clima_media[i].estp_com2 == 1) {
        mob.Lista_data_clima_media[i].alt = mob.Lista_data_clima_media[i].arm;
      } else {
        mob.Lista_data_clima_media[i].alt = 0;
      }
    } else {
      if (mob.Lista_data_clima_media[i].estp_com2 == 1) {
        mob.Lista_data_clima_media[i].alt = mob.Lista_data_clima_media[i].arm -
            mob.Lista_data_clima_media[i - 1].arm;
      } else {
        mob.Lista_data_clima_media[i].alt = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (i == 0) {
      if (mob.Lista_data_clima_media[i].estp_com2 == 1) {
        if (mob.Lista_data_clima_media[i].p_etp >= 0 &&
            mob.Lista_data_clima_media[i].alt >= 0) {
          mob.Lista_data_clima_media[i].etr = mob.Lista_data_clima_media[i].etp;
        } else {
          mob.Lista_data_clima_media[i].etr = mob.Lista_data_clima_media[i].p +
              mob.Lista_data_clima_media[i].alt.abs();
        }
      } else {
        mob.Lista_data_clima_media[i].etr = 0;
      }
    } else {
      if (mob.Lista_data_clima_media[i].estp_com2 == 1) {
        if (mob.Lista_data_clima_media[i].p_etp >= 0) {
          mob.Lista_data_clima_media[i].etr = mob.Lista_data_clima_media[i].etp;
        } else {
          mob.Lista_data_clima_media[i].etr = mob.Lista_data_clima_media[i].p +
              mob.Lista_data_clima_media[i].alt.abs();
        }
      } else {
        mob.Lista_data_clima_media[i].etr = 0;
      }
    }
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].etp_com2 == 1) {
      mob.Lista_data_clima_media[i].def =
          mob.Lista_data_clima_media[i].etp - mob.Lista_data_clima_media[i].etr;
    } else {
      mob.Lista_data_clima_media[i].def = 0;
    }
    //----------------------------------------------------------------------------------------------------------
    if (mob.Lista_data_clima_media[i].etp_com2 == 1) {
      if (mob.Lista_data_clima_media[i].arm < double.parse(mob.cad)) {
        mob.Lista_data_clima_media[i].exc = 0;
      } else {
        if (mob.Lista_data_clima_media[i].arm == double.parse(mob.cad)) {
          mob.Lista_data_clima_media[i].exc =
              mob.Lista_data_clima_media[i].p_etp -
                  mob.Lista_data_clima_media[i].alt;
        } else {
          mob.Lista_data_clima_media[i].exc = 0;
        }
      }
    } else {
      mob.Lista_data_clima_media[i].exc = 0;
    }
    //----------------------------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------------------
  }
}
