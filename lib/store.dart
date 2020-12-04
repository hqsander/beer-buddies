import 'package:beer_buddies/modelo/cerveja.dart';
import 'package:flutter/foundation.dart';

class Store extends ChangeNotifier {
  List<Cerveja> cervejas = [
    Cerveja(
        nome: "nome1",
        cervejaria: "cervejaria1",
        estilo: "estilo1",
        possuiIbuInformado: true,
        ibu: 40,
        teor: 5,
        odor: 3,
        sabor: 3,
        retrogosto: 3),
    Cerveja(
        nome: "nome2",
        cervejaria: "cervejaria2",
        estilo: "estilo2",
        possuiIbuInformado: true,
        ibu: 40,
        teor: 5,
        odor: 3,
        sabor: 3,
        retrogosto: 3),
    Cerveja(
        nome: "nome3",
        cervejaria: "cervejaria3",
        estilo: "estilo3",
        possuiIbuInformado: true,
        ibu: 40,
        teor: 5,
        odor: 3,
        sabor: 3,
        retrogosto: 3),
  ];

  void addCerveja(Cerveja novaCerveja) {
    cervejas.add(novaCerveja);
    notifyListeners();
  }
}
