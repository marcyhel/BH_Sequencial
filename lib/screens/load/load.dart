import 'package:bh_sequencial/screens/principal.dart';
import 'package:flutter/material.dart';

class Load extends StatelessWidget {
  const Load({Key? key}) : super(key: key);
  Future<void> load(context) async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Principal()),
    );
  }

  @override
  Widget build(BuildContext context) {
    load(context);
    return Container(
      child: Center(
          child: Container(
              height: 100, width: 100, child: CircularProgressIndicator())),
    );
  }
}
