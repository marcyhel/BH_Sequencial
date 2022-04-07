import 'package:bh_sequencial/screens/tabela/widgets/larg_tabela.dart';
import 'package:flutter/material.dart';

class Tabela_result extends StatelessWidget {
  const Tabela_result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: LargTabela(),
    );
  }
}
