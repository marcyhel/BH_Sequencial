import 'package:bh_sequencial/screens/footer/footer_larg.dart';
import 'package:bh_sequencial/screens/footer/footer_small.dart';
import 'package:bh_sequencial/screens/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Foolter extends StatelessWidget {
  const Foolter({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context) ? FooterSmall():FooterLarg();
  }
}