import 'package:flutter/material.dart';

class Button_Calc extends StatelessWidget {
  Function func;
  String text;
  bool carrega;
  Button_Calc({
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
      color: Colors.blue.shade200.withAlpha(190),
      child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Theme.of(context).cardColor,
          child: Container(
            // width: MediaQuery.of(context).size.width / 7,
            height: 50,
            padding: EdgeInsets.all(5),
            child: carrega
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.white,
                  ))
                : Center(
                    child: Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  )),
          ),
          onTap: carrega
              ? null
              : () {
                  func();
                }),
    );
  }
}
