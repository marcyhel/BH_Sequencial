import 'package:flutter/material.dart';
import 'dart:html' as html;
class FooterLarg extends StatelessWidget {
  const FooterLarg({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      width: MediaQuery.of(context).size.width,
      height: 300,
      color: Colors.blue[900],
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text("Caso seja necessario você tambem pode utilizar o SISDAGRO do INMET",style: TextStyle(fontSize: 20,color: Colors.white),),
        SizedBox(height: 5,),
        GestureDetector( 
          onTap:(){
         html.window.open('http://sisdagro.inmet.gov.br/', "Sisdagro");
      },
          child: Text('http://sisdagro.inmet.gov.br/',style: TextStyle(fontSize: 20,color: Colors.white),),
        ),
        Expanded(child: Container()),
        Container(color: Colors.white24,width: MediaQuery.of(context).size.width,height: 2,),
        Text("2022®",style: TextStyle(fontSize: 20,color: Colors.white),)
      ],
    ),
    );
  }
}