import 'package:beer_buddies/modelo/cerveja.dart';
import 'package:beer_buddies/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaEdicaoCerveja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
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
                  SliderAvaliacao(
                    item: "IBU",
                    min: 10,
                    max: 95,
                    divisions: 85,
                    precisao: 0,
                  ),
                  SliderAvaliacao(
                    item: "Teor",
                    min: 3,
                    max: 11,
                    divisions: 16,
                    precisao: 1,
                  ),
                  SliderAvaliacao(
                    item: "Odor",
                    min: 1,
                    max: 5,
                    divisions: 4,
                    precisao: 0,
                  ),
                  SliderAvaliacao(
                    item: "Sabor",
                    min: 1,
                    max: 5,
                    divisions: 4,
                    precisao: 0,
                  ),
                  SliderAvaliacao(
                    item: "Retrogosto",
                    min: 1,
                    max: 5,
                    divisions: 4,
                    precisao: 0,
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

class SliderAvaliacao extends StatefulWidget {
  final String item;
  final double min;
  final double max;
  final int divisions;
  final int precisao;

  SliderAvaliacao(
      {this.item, this.min, this.max, this.divisions, this.precisao});

  @override
  _SliderAvaliacaoState createState() => _SliderAvaliacaoState();
}

class _SliderAvaliacaoState extends State<SliderAvaliacao> {
  double valor;

  @override
  void initState() {
    valor = widget.min;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(widget.item),
          ),
          Expanded(
            flex: 1,
            child: Text(valor.toStringAsFixed(widget.precisao)),
          ),
          Expanded(
            flex: 4,
            child: Slider(
              activeColor: Colors.amber,
              value: valor,
              min: widget.min,
              max: widget.max,
              divisions: widget.divisions,
              label: valor.toStringAsFixed(widget.precisao),
              onChanged: (double value) {
                setState(() {
                  valor = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
