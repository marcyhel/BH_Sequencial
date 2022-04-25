import 'package:bh_sequencial/screens/resultados/resultado_small.dart';
import 'package:bh_sequencial/screens/resultados/resultados_larg.dart';
import 'package:bh_sequencial/screens/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Resultados_parcial extends StatelessWidget {
  const Resultados_parcial({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context) ? Resultados_parcial_Small() : Resultados_parcial_Larg();
  }
}