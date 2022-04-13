import 'package:bh_sequencial/screens/grafcos/widget/car_graf.dart';
import 'package:bh_sequencial/screens/grafcos/widget/graf1.dart';
import 'package:bh_sequencial/screens/grafcos/widget/graf2.dart';
import 'package:bh_sequencial/screens/grafcos/widget/graf3.dart';
import 'package:bh_sequencial/screens/grafcos/widget/graf4.dart';
import 'package:bh_sequencial/screens/grafcos/widget/tab1.dart';
import 'package:bh_sequencial/screens/grafcos/widget/tab2.dart';
import 'package:bh_sequencial/screens/grafcos/widget/tab3.dart';
import 'package:bh_sequencial/screens/grafcos/widget/tab4.dart';
import 'package:flutter/material.dart';

class Graficos extends StatelessWidget {
  const Graficos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card_graf(
            tab: Tab4(),
            graf: Graf4(),
          ),
          Card_graf(
            tab: Tab3(),
            graf: Graf3(),
          ),
          Card_graf(
            tab: Tab1(),
            graf: Graf1(),
          ),
          Card_graf(
            tab: Tab2(),
            graf: Graf2(),
          ),
        ],
      ),
    );
  }
}
