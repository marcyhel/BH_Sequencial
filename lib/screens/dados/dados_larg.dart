import 'package:bh_sequencial/screens/dados/widget/button_clima.dart';
import 'package:bh_sequencial/screens/dados/widget/card_custon_drop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'widget/tabela.dart';

class Dados_Larg extends StatefulWidget {
  const Dados_Larg({Key? key}) : super(key: key);

  @override
  State<Dados_Larg> createState() => _DadosState();
}

class _DadosState extends State<Dados_Larg> with TickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController!.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: new Duration(seconds: 1), vsync: this);
    animationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black26)],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.blue, BlendMode.color),
          image: AssetImage("assets/4.png"),
          fit: BoxFit.cover,
        ),
        color: Color(0xff279c9c),
      ),
      //Color(0xff5ca4fb),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Custon_button(
                        func: () async {
                          await mob.sincronizar_dados();
                        },
                        text: "Sincronizar",
                        carrega: mob.isLoad,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Custon_button(
                        func: () async {
                          await mob.custonLista();
                        },
                        text: "Manual",
                        carrega: mob.isLoad,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  // padding: EdgeInsets.only(left: ),
                  child: Card_cuaton_Drop(
                      label: 'Estado', func: () {}, valor: 'valor', erro: false),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width / 3.5,
                  child: const Text(
                    "Dados Climaticos",
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
          ),
          Expanded(
            child: Observer(builder: (_) {
              return !mob.isLoad
                  ? Tabela(marge: EdgeInsets.only(left: 40, right: 20))
                  : Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(100),
                          padding: EdgeInsets.all(50),
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: CircularProgressIndicator(
                            valueColor: animationController!.drive(ColorTween(
                                begin: Color(0xff279c9c),
                                end: Colors.pink[800])),
                            strokeWidth: 6,
                            color: Colors.blue[900],
                          ),
                        ),
                      ],
                    );
            }),
          ),
        ],
      ),
    );
  }
}
