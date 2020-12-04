import 'package:beer_buddies/modelo/cerveja.dart';
import 'package:beer_buddies/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaEdicaoCerveja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Store>(context, listen: false).addCerveja(
            Cerveja(
                nome: "nome4",
                cervejaria: "cervejaria4",
                estilo: "estilo4",
                possuiIbuInformado: true,
                ibu: 40,
                teor: 5,
                odor: 3,
                sabor: 3,
                retrogosto: 3),
          );
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.amber,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 60,
              left: 30,
              right: 30,
              bottom: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Text(
                    "4.5",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Antuérpia",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Nikita Cherry Hickey",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("IBU"),
                        ),
                        Expanded(
                          flex: 4,
                          child: SliderIBU(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Teor"),
                        ),
                        Expanded(
                          flex: 4,
                          child: SliderIBU(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SliderIBU extends StatefulWidget {
  @override
  _SliderIBUState createState() => _SliderIBUState();
}

class _SliderIBUState extends State<SliderIBU> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: Colors.amber,
      value: _currentSliderValue,
      min: 5,
      max: 80,
      divisions: 75,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(
          () {
            _currentSliderValue = value;
          },
        );
      },
    );
  }
}
