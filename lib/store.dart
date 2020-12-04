import 'package:beer_buddies/modelo/cerveja.dart';
import 'package:flutter/foundation.dart';

class Store extends ChangeNotifier {
  List<Cerveja> cervejas = [];

  void addCerveja(Cerveja novaCerveja) {
    cervejas.add(novaCerveja);
    notifyListeners();
  }
}
