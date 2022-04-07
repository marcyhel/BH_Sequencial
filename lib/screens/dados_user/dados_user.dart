import 'package:bh_sequencial/screens/dados/widget/button_clima.dart';
import 'package:bh_sequencial/screens/dados_user/widget/button_calc.dart';
import 'package:bh_sequencial/screens/dados_user/widget/card_custon_input.dart';
import 'package:bh_sequencial/screens/load/load.dart';
import 'package:flutter/material.dart';

class Dados_User extends StatelessWidget {
  const Dados_User({Key? key}) : super(key: key);

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
                  func: () {},
                  label: "Cad",
                  valor: "",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Card_cuaton_input(
                        erro: false,
                        func: () {},
                        label: "I",
                        valor: "",
                      ),
                    ),
                    Expanded(
                      child: Card_cuaton_input(
                        erro: false,
                        func: () {},
                        label: "A",
                        valor: "",
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Button_Calc(
                        func: () {
                          Navigator.pop(context);
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
                  "Dados Climaticos",
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
                  "A sincronização sera feita com os dados colhidos pelo INMET, caso nessesario a inserção dos dados manualmente basta clicar em 'Manual'",
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
