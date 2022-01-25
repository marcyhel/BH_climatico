import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:plat2/mobx/models/salvar.dart';

import 'package:plat2/screens/Clima/clima.dart';
import 'package:plat2/screens/home/home.dart';
import 'package:plat2/screens/principal.dart';
import 'package:plat2/screens/resultados/resultados.dart';
import 'package:plat2/screens/tabela/tabela.dart';

import 'mobx/mob_dados.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('caixacultura');

  singletonsApp(box);
  await carrega_dados();
  runApp(const MyApp());
}

void singletonsApp(box) {
  GetIt.I.registerSingleton(Mob_Dados(box));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '',
      routes: {
        '': (context) => const Home_page(),
        '/clima': (context) => const Clima_page(),
        '/tabela': (context) => TabelaDados(),
        '/resultado': (context) => const Resultados(),
      },
    );
  }
}