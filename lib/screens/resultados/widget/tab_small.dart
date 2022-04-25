import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:bh_sequencial/mob/State/mob_state.dart';
class Tab1_small extends StatelessWidget {
  Tab1_small({Key? key}) : super(key: key);
  final Mob_State mob = GetIt.I<Mob_State>();
  List<String> mes = [
    'Mês',
    'Prec',
    'ETP',
    'ETR',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
      padding: EdgeInsets.symmetric(vertical: 10),
      
      width: MediaQuery.of(context).size.width / 1,
      child: Column(
        children: List.generate((mob.Lista_data_clima_media.length/2).toInt(), (index) {
          index = index - 1;
          var auxIndex=index;
          auxIndex+=(mob.Lista_data_clima_media.length/2).toInt();
          return Container(
            padding: EdgeInsets.all(5),
           // margin: EdgeInsets.only(top: 2, bottom: 2),
            color: index % 2 == 0 ? Colors.grey[300] : Colors.white,
            child: index < 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Text(
                          mes[0],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                          child: Text(
                        mes[1],
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: Text(
                        mes[2],
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: Text(
                        mes[3],
                        textAlign: TextAlign.center,
                      )),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: Text(
                        mob.Lista_data_clima_media[auxIndex].mes +
                            '/' +
                            mob.Lista_data_clima_media[auxIndex].ano,
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: Text(
                        (mob.Lista_data_clima_media[auxIndex].p
                            .toStringAsFixed(1)),
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: Text(
                        mob.Lista_data_clima_media[auxIndex].etp
                            .toStringAsFixed(1),
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: Text(
                        mob.Lista_data_clima_media[auxIndex].etr
                            .toStringAsFixed(1),
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
          );
        }),
      ),
    );
  }
}

class Teste {
  String mes;
  double def;
  double exc;
  Teste(this.mes, this.def, this.exc) {}
}
