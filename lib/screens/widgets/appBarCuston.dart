import 'dart:math';

import 'package:flutter/material.dart';



class AppBarCuston extends StatelessWidget {
  double opaci;
  AppBarCuston({
    Key? key,
    required this.opaci,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _opacity = 0;
    var screenSize = MediaQuery.of(context).size;
    _opacity = opaci < screenSize.height * 0.40
        ? (opaci / (screenSize.height * 0.40)) > 0
            ? opaci / (screenSize.height * 0.40)
            : 0
        : 1;
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(_opacity),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 15,
            color: Colors.black12.withOpacity(min(_opacity / 5, 0.5)),
          ),
        ],
      ),
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //margin: EdgeInsets.all(5),
            width: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/log.png"), fit: BoxFit.fitWidth),
            ),
          ),
          Row(
            children: [/*
              GestureDetector(
                onTap: () {
                  print("object");
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    height: 70,
                    child: const Center(
                      child: Text(
                        "Pagina 2",
                        style: TextStyle(
                          color: Color(0xff243CBF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 50),
              GestureDetector(
                onTap: () {
                  print("object");
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    height: 70,
                    child: const Center(
                      child: Text(
                        "Pagina 2",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 50),
              GestureDetector(
                onTap: () {
                  print("object");
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    height: 70,
                    child: const Center(
                      child: Text(
                        "Pagina 2",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),*/
            ],
          )
        ],
      ),
    );
  }
}
