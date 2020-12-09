import 'package:beer_buddies/modelo/cerveja.dart';
import 'package:beer_buddies/store.dart';
import 'package:beer_buddies/telas/tela_edicao_cerveja.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaListaCervejas extends StatelessWidget {
  List<Widget> montarListaCervejas(
      List<Cerveja> cervejas, BuildContext context) {
    List<Widget> tiles = [];

    cervejas.forEach((cerveja) {
      tiles.add(
        ListTile(
          leading: CircleAvatar(
            child: Icon(
              Icons.image,
              color: Colors.grey.shade300,
              size: 40,
            ),
            backgroundColor: Colors.white,
            radius: 30,
          ),
          title: Text(
            (cerveja.cervejaria + " - " + cerveja.nome),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 18,
              ),
              Text(
                ((cerveja.odor + cerveja.sabor + cerveja.retrogosto) / 3)
                    .toStringAsFixed(1),
                style: TextStyle(
                  color: Colors.amber.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(cerveja.estilo.toUpperCase()),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TelaEdicaoCerveja(cerveja: cerveja),
              ),
            );
          },
          onLongPress: () {
            Provider.of<Store>(context, listen: false).deleteCerveja(cerveja);
          },
        ),
      );
    });

    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
        children:
            montarListaCervejas(Provider.of<Store>(context).cervejas, context),
      ),
    );
  }
}
