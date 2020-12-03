import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaListaCervejas extends StatelessWidget {
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
        onPressed: () {},
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
        children: [
          ListTile(
            title: Text("Antuérpia"),
            subtitle: Text("Nikita Cherry Hickey"),
          ),
        ],
      ),
    );
  }
}
