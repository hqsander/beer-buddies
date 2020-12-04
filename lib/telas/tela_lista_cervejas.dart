import 'package:beer_buddies/modelo/cerveja.dart';
import 'package:beer_buddies/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaListaCervejas extends StatelessWidget {
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
        children: montarListaCervejas(Provider.of<Store>(context).cervejas),
      ),
    );
  }
}
