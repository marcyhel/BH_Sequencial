import 'package:bh_sequencial/mob/State/mob_state.dart';
import 'package:bh_sequencial/mob/model/model_dados_tabela.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';

final Mob_State mob = GetIt.I<Mob_State>();
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
  mob.box = await Hive.openBox('caixacultura');
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
