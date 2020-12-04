import 'package:beer_buddies/modelo/cerveja.dart';
import 'package:beer_buddies/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaEdicaoCerveja extends StatefulWidget {
  @override
  _TelaEdicaoCervejaState createState() => _TelaEdicaoCervejaState();
}

class _TelaEdicaoCervejaState extends State<TelaEdicaoCerveja> {
  Cerveja cerveja = new Cerveja();

  double calculaMedia() {
    if (cerveja.odor != null &&
        cerveja.sabor != null &&
        cerveja.retrogosto != null) {
      return (cerveja.odor + cerveja.sabor + cerveja.retrogosto) / 3;
    }
    return 0;
  }

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
          cerveja.estilo = "Estilo";
          cerveja.possuiIbuInformado = true;

          Provider.of<Store>(context, listen: false).addCerveja(cerveja);
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
                    calculaMedia().toStringAsFixed(1),
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
                TextField(
                  cursorColor: Colors.white,
                  autofocus: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  onChanged: (cervejaria) => cerveja.cervejaria = cervejaria,
                ),
                TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  onChanged: (nome) => cerveja.nome = nome,
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
                    callback: (double ibu) => cerveja.ibu = ibu,
                  ),
                  SliderAvaliacao(
                    item: "Teor",
                    min: 3,
                    max: 11,
                    divisions: 16,
                    precisao: 1,
                    callback: (double teor) => cerveja.teor = teor,
                  ),
                  SliderAvaliacao(
                    item: "Odor",
                    min: 1,
                    max: 5,
                    divisions: 4,
                    precisao: 0,
                    callback: (double odor) {
                      cerveja.odor = odor.round();
                      setState(() {
                        calculaMedia();
                      });
                    },
                  ),
                  SliderAvaliacao(
                    item: "Sabor",
                    min: 1,
                    max: 5,
                    divisions: 4,
                    precisao: 0,
                    callback: (double sabor) {
                      cerveja.sabor = sabor.round();
                      setState(() {
                        calculaMedia();
                      });
                    },
                  ),
                  SliderAvaliacao(
                    item: "Retrogosto",
                    min: 1,
                    max: 5,
                    divisions: 4,
                    precisao: 0,
                    callback: (double retrogosto) {
                      cerveja.retrogosto = retrogosto.round();
                      setState(() {
                        calculaMedia();
                      });
                    },
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
  final Function callback;

  SliderAvaliacao(
      {this.item,
      this.min,
      this.max,
      this.divisions,
      this.precisao,
      this.callback});

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
              onChangeEnd: widget.callback,
            ),
          ),
        ],
      ),
    );
  }
}
