import 'package:cutout_text_effect/cutout_text_effect.dart';
import 'package:flutter/material.dart';

class Painel extends StatefulWidget {
  double top;
  Painel({
    Key? key,
    required this.top,
  }) : super(key: key);

  @override
  State<Painel> createState() => _PainelState();
}

class _PainelState extends State<Painel> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.blue, BlendMode.color),
          child: Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/painel2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.only(left: 40),
                  child: Center(
                    child: CustomPaint(
                      painter: CutOutText(
                        text: 'Balanço Hídrico\nSequencial',
                        textDirection: TextDirection.ltr,
                        boxRadius: 0,
                        boxBackgroundColor: Colors.white,
                        textStyle: const TextStyle(
                          letterSpacing: 10,
                          fontFamily: 'mark',
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 70),
                /*Container(
                  margin: EdgeInsets.only(left: 50),
                  //color: Colors.amber,
                  width: MediaQuery.of(context).size.width / 3,
                  child: const Text(
                    'Crie um modelo de site profissional gratuito. Responsivo, totalmente personalizável com fácil editor de Nicepage Arrastar e Soltar. Ajuste cores, fontes, cabeçalho e rodapé, layout e outros elementos de design, bem como conteúdo e imagens',
                    style: TextStyle(
                      height: 2,
                      color: Colors.white,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      fontFamily: 'mark',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
        Positioned(
            left: MediaQuery.of(context).size.width / 10,
            bottom: 50,
            child: InsidePainel(
              cor: Color(0xff243CBF),
            )),
        Positioned(
            left: MediaQuery.of(context).size.width / 1.3,

            //bottom: 50,
            top: 100,
            child: InsidePainel(
              cor: Color(0xff394273),
            )),
      ],
    );
  }
}

class InsidePainel extends StatelessWidget {
  Color cor = Colors.white;
  InsidePainel({
    Key? key,
    required this.cor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: cor, boxShadow: [
        BoxShadow(offset: Offset(2, 2), blurRadius: 15, color: Colors.black38)
      ]),
      width: 250,
      height: 250,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      child: const Text(
        "Crie um modelo de site profissional gratuito. Responsivo, totalmente personalizável com fácil editor de Nicepage Arrastar e Soltar. Ajuste cores, fontes, cabeçalho e rodapé, layout e outros elementos de design, bem como conteúdo e imagens",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
