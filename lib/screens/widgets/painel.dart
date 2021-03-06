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
                  //height: 100,
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.only(left: 40),

                  child: Center(
                    child:
                    Text("Balanço Hídrico\nSequencial", style: TextStyle(
                      color: Colors.white,
                      fontSize: 60
                      ,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 2,
                          color: Colors.black38,
                        ),
                      ],
                    ),),
                    /* CustomPaint(
                      painter: CutOutText(
                        text: 'Balanço Hídrico\nSequencial',
                        textDirection: TextDirection.ltr,
                        boxRadius: 0,
                        boxBackgroundColor: Colors.black87,
                        textStyle: const TextStyle(
                          letterSpacing: 10,
                          fontFamily: 'mark',
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),*/
                  ),
                ),
                SizedBox(height: 70),
               
              ],
            ),
          ),
        ),
       
        Positioned(
            left: MediaQuery.of(context).size.width / 1.4,

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
      child: Column(
        children: [
        Container(
                  margin: const EdgeInsets.all(0),
                  //width: MediaQuery.of(context).size.width / 10.5,
                  child: const Text(
                    "O que é ?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
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
                SizedBox(height: 5),
                Container(
                  margin: const EdgeInsets.all(0),
                 // width: MediaQuery.of(context).size.width / 3.5,
                  child: const Text(
                    "O Balanço hídrico sequencial (BHS) permite acompanhar a disponibilidade de água no solo ao longo de um periodo. O cálculo é feito para uma cobertura vegetal ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
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
    );
  }
}
