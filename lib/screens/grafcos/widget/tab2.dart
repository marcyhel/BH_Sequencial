import 'package:bh_sequencial/mob/State/mob_state.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Tab2 extends StatelessWidget {
  Tab2({Key? key}) : super(key: key);
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
      width: MediaQuery.of(context).size.width / 5,
      child: Column(
        children: List.generate(mob.Lista_data_clima_media.length, (index) {
          index = index - 1;
          return Container(
            margin: EdgeInsets.only(top: 2, bottom: 2),
            color: index % 2 == 0 ? Colors.black12 : Colors.white,
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
                        mob.Lista_data_clima_media[index].mes +
                            '/' +
                            mob.Lista_data_clima_media[index].ano,
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: Text(
                        (mob.Lista_data_clima_media[index].p
                            .toStringAsFixed(1)),
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: Text(
                        mob.Lista_data_clima_media[index].etp
                            .toStringAsFixed(1),
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: Text(
                        mob.Lista_data_clima_media[index].etr
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
