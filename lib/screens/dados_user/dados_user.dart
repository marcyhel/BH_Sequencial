import 'package:bh_sequencial/screens/dados_user/dados_user_larg.dart';
import 'package:bh_sequencial/screens/dados_user/dados_user_small.dart';
import 'package:bh_sequencial/screens/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Dados_User extends StatelessWidget {
  const Dados_User({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context) ? Dados_User_Small() : Dados_User_Larg();
  }
}