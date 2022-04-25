import 'package:flutter/material.dart';

class Buuton_Small extends StatelessWidget {
  Function func;
  String text;
  bool carrega;
  Buuton_Small({
    Key? key,
    required this.func,
    required this.text,
    required this.carrega,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Theme.of(context).cardColor,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.2,
            height: 50,
            padding: EdgeInsets.all(5),
            child: carrega
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Color(0xff4E436E),
                  ))
                : Center(child: Text(text)),
          ),
          onTap: carrega
              ? null
              : () {
                  func();
                }),
    );
  }
}
