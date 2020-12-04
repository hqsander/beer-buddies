import 'package:beer_buddies/telas/tela_edicao_cerveja.dart';
import 'package:beer_buddies/telas/tela_lista_cervejas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => TelaListaCervejas(),
        "/edicao": (context) => TelaEdicaoCerveja(),
      },
    );
  }
}
