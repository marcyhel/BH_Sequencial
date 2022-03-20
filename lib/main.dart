import 'package:bh_sequencial/screens/principal.dart';
import 'package:bh_sequencial/mob/State/mob_state.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
void main() {
  singletonsApp();
  runApp(const MyApp());
}

void singletonsApp() {
  GetIt.I.registerSingleton(Mob_State());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Principal());
  }
}
