import 'package:flutter/material.dart';

class Text1 extends StatelessWidget {
  const Text1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Titulo",
            style: TextStyle(fontSize: 50),
          ),
          Text("d")
        ],
      ),
    );
  }
}
