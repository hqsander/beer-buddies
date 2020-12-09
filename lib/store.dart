import 'package:beer_buddies/modelo/cerveja.dart';
import 'package:flutter/foundation.dart';

class Store extends ChangeNotifier {
  List<Cerveja> cervejas = [
    Cerveja(
      cervejaria: "Antuérpia",
      nome: "Nikita Hazelnut Stuck",
      estilo: "STOUT",
      possuiIbuInformado: false,
      ibu: 0,
      teor: 11.3,
      odor: 5,
      sabor: 5,
      retrogosto: 5,
    ),
    Cerveja(
      cervejaria: "Hemmer",
      nome: "Blumenau",
      estilo: "IPA",
      possuiIbuInformado: true,
      ibu: 55,
      teor: 6,
      odor: 4,
      sabor: 3,
      retrogosto: 4,
    ),
    Cerveja(
      cervejaria: "Prússia Bier",
      nome: "Red Ale",
      estilo: "ALE",
      possuiIbuInformado: true,
      ibu: 20,
      teor: 4,
      odor: 3,
      sabor: 4,
      retrogosto: 2,
    ),
    Cerveja(
      cervejaria: "Bruder",
      nome: "Trindade",
      estilo: "PORTER",
      possuiIbuInformado: true,
      ibu: 20,
      teor: 7,
      odor: 3,
      sabor: 5,
      retrogosto: 5,
    ),
    Cerveja(
      cervejaria: "Antuérpia",
      nome: "Eugenia",
      estilo: "Witbier",
      possuiIbuInformado: true,
      ibu: 15,
      teor: 5.5,
      odor: 4,
      sabor: 4,
      retrogosto: 2,
    ),
    Cerveja(
      cervejaria: "Ashby",
      nome: "Nirvana",
      estilo: "IPA",
      possuiIbuInformado: true,
      ibu: 55,
      teor: 5.5,
      odor: 1,
      sabor: 2,
      retrogosto: 2,
    ),
    Cerveja(
      cervejaria: "Wals",
      nome: "Niobium",
      estilo: "IPA",
      possuiIbuInformado: true,
      ibu: 93,
      teor: 9,
      odor: 2,
      sabor: 4,
      retrogosto: 5,
    ),
    Cerveja(
      cervejaria: "Hocus Pocus",
      nome: "Interstellar",
      estilo: "IPA",
      possuiIbuInformado: true,
      ibu: 75,
      teor: 7,
      odor: 4,
      sabor: 3,
      retrogosto: 4,
    ),
    Cerveja(
      cervejaria: "Guinness",
      nome: "Draught",
      estilo: "Stout",
      possuiIbuInformado: false,
      ibu: 0,
      teor: 4.2,
      odor: 3,
      sabor: 2,
      retrogosto: 2,
    ),
    Cerveja(
      cervejaria: "Wals",
      nome: "Petroleum",
      estilo: "STOUT",
      possuiIbuInformado: true,
      ibu: 40,
      teor: 12,
      odor: 5,
      sabor: 5,
      retrogosto: 5,
    ),
  ];

  void addCerveja(Cerveja novaCerveja) {
    cervejas.add(novaCerveja);
    notifyListeners();
  }

  void deleteCerveja(Cerveja cerveja) {
    cervejas.remove(cerveja);
    notifyListeners();
  }
}
