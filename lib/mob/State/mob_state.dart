import 'dart:math';

import 'package:bh_sequencial/mob/model/calculo.dart';
import 'package:bh_sequencial/mob/model/model_dados_tabela.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobx/mobx.dart';
part 'mob_state.g.dart';

class Mob_State = _Mob_StateBase with _$Mob_State;

abstract class _Mob_StateBase with Store {
  Box box;
  _Mob_StateBase(this.box) {}
  @action
  bool calcula() {
    try {
      calcular();
    } catch (e) {
      return false;
    }
    return true;
  }

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
  String i = '';
  @observable
  String a = '';
  @observable
  String nda_inicial = '';

  @observable
  double maior_etp_ncom = 0;
  @observable
  double maior_etp_com = 0;
  @observable
  double maior_etp_com2 = 0;
  @observable
  double cq10 = 0;
  @observable
  double soma_vlr1 = 0;

  @observable
  double latitude = 20.83;
  @observable
  double x9 = -22;

  @observable
  double ci = 0;
  @observable
  double cj = 1;
  @observable
  double ck = 0;
  @observable
  double co = 0;
  @observable
  double cq = 0;
  @observable
  double cr = 0;
  @observable
  double cs = 0;
  @observable
  double ct = 0;
  @observable
  double cu = 0;
  @observable
  double cv = 0;
  @observable
  double cw = 0;
  @observable
  double cx = 0;
  @observable
  double cy = 0;
  @observable
  double cz = 0;
  @observable
  double de = 0;
  @observable
  double df = 0;
  @observable
  double dg1 = 0;
  @observable
  double dg2 = 0;
  @observable
  double dh = 0;
  @observable
  double di = 0;
  @observable
  double dj = 0;
  @observable
  double dk = 0;
  @observable
  double dl = 0;

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
  void setI(valor) => i = valor;
  @action
  void setA(valor) => a = valor;
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

      for (var i = 0; i < res.length; i++) {
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
          (DateTime.now().year - 2).toString(),
        ),
      );
    }
    for (var i = 1; i <= 12; i++) {
      Lista_data_clima_media.add(
        DataClimaMedia(
          30,
          0,
          0,
          def_mes(i),
          (DateTime.now().year - 1).toString(),
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
