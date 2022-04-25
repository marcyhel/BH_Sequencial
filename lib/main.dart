import 'package:bh_sequencial/screens/principal.dart';
import 'package:bh_sequencial/mob/State/mob_state.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('caixacultura');
  singletonsApp(box);
  runApp(const MyApp());
}

void singletonsApp(box) {
  GetIt.I.registerSingleton(Mob_State(box));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Sequential Climatological Water Balance - Software para cálculo do Balanço Hí-drico Climatológico Sequencial',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Principal());
  }
}
