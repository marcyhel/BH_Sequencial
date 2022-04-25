import 'package:bh_sequencial/mob/State/mob_state.dart';
import 'package:bh_sequencial/mob/model/salvar.dart';
import 'package:bh_sequencial/screens/dados/widget/button_clima.dart';
import 'package:bh_sequencial/screens/dados_user/widget/button_calc.dart';
import 'package:bh_sequencial/screens/dados_user/widget/card_custon_input.dart';
import 'package:bh_sequencial/screens/load/load.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Dados_User_Larg extends StatelessWidget {
  Dados_User_Larg({Key? key}) : super(key: key);
  final Mob_State mob = GetIt.I<Mob_State>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 150, bottom: 150, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 3.13,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card_cuaton_input(
                  erro: false,
                  func: (e) {
                    mob.setCad(e);
                  },
                  label: "Cad",
                  valor: mob.cad,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Card_cuaton_input(
                        erro: false,
                        func: (e) {
                          mob.setI(e);
                        },
                        label: "I",
                        valor: mob.i,
                      ),
                    ),
                    Expanded(
                      child: Card_cuaton_input(
                        erro: false,
                        func: (e) {
                          mob.setA(e);
                        },
                        label: "A",
                        valor: mob.a,
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Button_Calc(
                        func: () {
                          Navigator.pop(context);
                          mob.calcula();
                          salvar_dados();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Load()),
                          );
                        },
                        text: "Calcular",
                        carrega: false))
              ],
            ),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 3.5,
                child: const Text(
                  "Dados Nessesarios",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 2,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width / 3.5,
                child: const Text(
                  "Esses são mais alguns dados nessesarios para os calculo, lembre-se de usar ponto (.) ao em vez de virgula (,) caso seja nessesario",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 2,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
