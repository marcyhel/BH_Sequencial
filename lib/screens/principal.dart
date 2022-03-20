import 'package:bh_sequencial/mob/State/mob_state.dart';
import 'package:bh_sequencial/screens/dados/dados.dart';
import 'package:bh_sequencial/screens/load/load.dart';
import 'package:bh_sequencial/screens/widgets/appBarCuston.dart';
import 'package:bh_sequencial/screens/widgets/painel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:smooth_scroll_web/smooth_scroll_web.dart';

import 'widgets/text1.dart';

class Principal extends StatefulWidget {
  Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final Mob_State mob = GetIt.I<Mob_State>();
  double _opacity = 0;
  final ScrollController _controller = new ScrollController();
  var top = 0.0;
  @override
  @override
  Widget build(BuildContext context) {
    //print(top);
    mob.to = 0;
    return Scaffold(
      body: Stack(
        children: [
          SmoothScrollWeb(
            controller: _controller,
            child: NotificationListener(
                onNotification: (v) {
                  if (v is ScrollUpdateNotification) {
                    if (v.metrics.axis != Axis.horizontal) {
                      top += v.scrollDelta! / 2;

                      mob.to += v.scrollDelta! / 1.9;
                      //temp();
                    }
                  }

                  return true;
                },
                child: SingleChildScrollView(
                  controller: _controller,
                  physics: NeverScrollableScrollPhysics(),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                      ),
                      Observer(builder: (_) {
                        //print("d");
                        return Positioned(top: mob.to, child: Painel(top: top));
                      }),
                      //Painel(top: top),

                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Dados(),
                            FlatButton(
                                onPressed: () {
                                  mob.gera();
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Load()),
                                  );
                                },
                                child: Text("ddddd")),
                            Column(
                              children: [
                                ...List.generate(
                                    mob.list_graf.length,
                                    (index) => Text(
                                        mob.list_graf[index].nun.toString()))
                              ],
                            ),
                            Text1(),
                            ...List.generate(300, (index) => Text("__${index}"))
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Observer(builder: (_) {
            return GestureDetector(
                onTap: () {
                  //print(_controller.offset);

                  /*setState(() {
                    _controller.animateTo(
                      1500.0,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 300),
                    );
                  });*/
                },
                child: AppBarCuston(opaci: mob.to));
          })
        ],
      ),
    );
  }
}