import 'package:bh_sequencial/screens/grafcos/grafico_larg.dart';
import 'package:bh_sequencial/screens/grafcos/grafico_small.dart';
import 'package:bh_sequencial/screens/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Graficos extends StatelessWidget {
  const Graficos({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context) ? Graficos_small() : Graficos_larg();
  }
}