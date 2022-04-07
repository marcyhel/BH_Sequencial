import 'package:bh_sequencial/screens/resultados/widget/tab_result_parcial.dart';
import 'package:flutter/material.dart';

class Resultados_parcial extends StatelessWidget {
  const Resultados_parcial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
      decoration: const BoxDecoration(
        //boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black26)],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.blue, BlendMode.color),
          image: AssetImage("assets/7.png"),
          fit: BoxFit.cover,
        ),
        //color: Color(0xff279c9c),
      ),
      //width: MediaQuery.of(context).size.width,
      //height: 1000,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width / 3.5,
                    child: const Text(
                      "Resultados Parciais",
                      style: TextStyle(
                        color: Colors.white,
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
                        color: Colors.white,
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
              Tab1(),
            ],
          ),
        ],
      ),
    );
  }
}
