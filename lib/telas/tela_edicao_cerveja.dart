import 'package:beer_buddies/constantes.dart';
import 'package:beer_buddies/modelo/cerveja.dart';
import 'package:beer_buddies/store.dart';
import 'package:beer_buddies/widgets/star_rating.dart';
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
          cerveja.possuiIbuInformado = true;

          if (cerveja.cervejaria != null &&
              cerveja.nome != null &&
              cerveja.estilo != null &&
              cerveja.ibu != null &&
              cerveja.teor != null &&
              cerveja.odor != null &&
              cerveja.sabor != null &&
              cerveja.retrogosto != null) {
            Provider.of<Store>(context, listen: false).addCerveja(cerveja);
            Navigator.pop(context);
          }
        },
      ),
      backgroundColor: Colors.amber,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 60,
              left: 10,
              right: 10,
              bottom: 30,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      TextField(
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: "Cervejaria",
                            fillColor: Colors.amber.shade400),
                        cursorColor: Colors.white,
                        style: kTextStyleFormulario,
                        onChanged: (cervejaria) =>
                            cerveja.cervejaria = cervejaria,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      TextField(
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: "Nome", fillColor: Colors.amber.shade400),
                        cursorColor: Colors.white,
                        style: kTextStyleFormulario,
                        onChanged: (nome) => cerveja.nome = nome,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      TextField(
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: "Estilo",
                            fillColor: Colors.amber.shade400),
                        cursorColor: Colors.white,
                        style: kTextStyleFormulario,
                        onChanged: (estilo) => cerveja.estilo = estilo,
                      ),
                    ],
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
                    callback: (double ibu) => cerveja.ibu = ibu,
                  ),
                  SliderAvaliacao(
                    item: "Teor",
                    min: 3,
                    max: 13,
                    divisions: 100,
                    precisao: 1,
                    callback: (double teor) => cerveja.teor = teor,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Odor"),
                        ),
                        Expanded(
                          flex: 4,
                          child: AvaliacaoCriterio(
                            onChanged: (int odor) {
                              cerveja.odor = odor;
                              setState(() {
                                calculaMedia();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Sabor"),
                        ),
                        Expanded(
                          flex: 4,
                          child: AvaliacaoCriterio(
                            onChanged: (int sabor) {
                              cerveja.sabor = sabor;
                              setState(() {
                                calculaMedia();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Retrogosto"),
                        ),
                        Expanded(
                          flex: 4,
                          child: AvaliacaoCriterio(
                            onChanged: (int retrogosto) {
                              cerveja.retrogosto = retrogosto;
                              setState(() {
                                calculaMedia();
                              });
                            },
                          ),
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

class AvaliacaoCriterio extends StatefulWidget {
  final Function onChanged;

  AvaliacaoCriterio({this.onChanged});

  @override
  _AvaliacaoCriterioState createState() => _AvaliacaoCriterioState();
}

class _AvaliacaoCriterioState extends State<AvaliacaoCriterio> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return StarRating(
      value: rating,
      onChanged: (int rating) {
        widget.onChanged(rating);
        setState(() {
          this.rating = rating;
        });
      },
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
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                valor.toStringAsFixed(widget.precisao),
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
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
