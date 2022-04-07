import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Tab1 extends StatelessWidget {
  Tab1({Key? key}) : super(key: key);
  //final Mob_Dados mob = GetIt.I<Mob_Dados>();
  List<String> mes = [
    'Mês',
    'DEF(-1)',
    'EXC',
  ];
  List<Teste> Lista_data_clima_media = [
    Teste('mes', 50, 50),
    Teste('mes', 50, 850),
    Teste('mes', 505, 50),
    Teste('mes', 40, 50)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 5,
      padding: EdgeInsets.all(20),
      // margin: EdgeInsets.symmetric(vertical: 300, horizontal: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(offset: Offset(2, 2), blurRadius: 5, color: Colors.black26),
        ],
      ),
      child: Column(
        children: List.generate(Lista_data_clima_media.length, (index) {
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
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: Text(
                        Lista_data_clima_media[index].mes,
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: Text(
                        (Lista_data_clima_media[index].def * -1)
                            .toStringAsFixed(1),
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: Text(
                        Lista_data_clima_media[index].exc.toStringAsFixed(1),
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
