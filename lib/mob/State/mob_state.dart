import 'dart:math';

import 'package:bh_sequencial/mob/model/model_dados_tabela.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobx/mobx.dart';
part 'mob_state.g.dart';

class Mob_State = _Mob_StateBase with _$Mob_State;

abstract class _Mob_StateBase with Store {
  @observable
  double to = 0;
  @observable
  ObservableList list_graf = ObservableList();
  @observable
  ObservableList Lista_data_clima = ObservableList();
  @observable
  ObservableList Lista_data_clima_media = ObservableList();
  @observable
  bool isLoad = false;
  @observable
  String estado = 'GOIANIA';
  @observable
  String cad = '';
  @observable
  String nda_inicial = '';

  @action
  void gera() {
    list_graf = ObservableList();
    for (var i = 0; i <= 5; i++) {
      list_graf.add(Graf());
    }
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

  @action
  Future<bool> sincronizar_dados() async {
    print("d");
    setIsload(true);
    await Future.delayed(Duration(milliseconds: 150));
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

  Future<void> custonLista() async {
    setIsload(true);
    await Future.delayed(const Duration(milliseconds: 550));
    Lista_data_clima_media = ObservableList();
    for (var i = 1; i <= 12; i++) {
      Lista_data_clima_media.add(
        DataClimaMedia(
          30,
          0,
          0,
          def_mes(i),
          DateTime.now().year.toString(),
        ),
      );
    }
    setIsload(false);
  }

  @action
  void setIsload(valor) => isLoad = valor;
  @action
  void setEstado(valor) => estado = valor;
}

class Graf {
  double nun = Random().nextDouble();
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
