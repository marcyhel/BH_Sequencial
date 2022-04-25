import 'package:bh_sequencial/screens/dados/dados_larg.dart';
import 'package:bh_sequencial/screens/dados/dados_small.dart';
import 'package:bh_sequencial/screens/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Dados extends StatelessWidget {
  const Dados({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   ResponsiveWidget.isSmallScreen(context) ? Dados_Small() : Dados_Larg();
  }
}