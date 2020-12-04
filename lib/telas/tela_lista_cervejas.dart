import 'package:beer_buddies/modelo/cerveja.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaListaCervejas extends StatelessWidget {
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

  List<Widget> montarListaCervejas(List<Cerveja> cervejas) {
    List<Widget> tiles = [];

    cervejas.forEach((cerveja) {
      tiles.add(
        ListTile(
          title: Text(cerveja.cervejaria),
          subtitle: Text(cerveja.nome),
        ),
      );
    });

    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/edicao");
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.list),
              color: Colors.amber,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.bar_chart),
              color: Colors.grey.shade600,
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: ListView(
        children: montarListaCervejas(cervejas),
      ),
    );
  }
}
