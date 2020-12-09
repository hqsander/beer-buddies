import 'package:beer_buddies/constantes.dart';
import 'package:beer_buddies/modelo/cerveja.dart';
import 'package:beer_buddies/store.dart';
import 'package:beer_buddies/widgets/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaEdicaoCerveja extends StatefulWidget {
  final Cerveja cerveja;

  TelaEdicaoCerveja({@required this.cerveja});

  @override
  _TelaEdicaoCervejaState createState() => _TelaEdicaoCervejaState();
}

class _TelaEdicaoCervejaState extends State<TelaEdicaoCerveja> {
  Cerveja cerveja;

  @override
  void initState() {
    super.initState();
    cerveja = widget.cerveja;
  }

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
                        controller: cerveja.cervejaria != null
                            ? TextEditingController(text: cerveja.cervejaria)
                            : null,
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: "Cervejaria",
                            fillColor: Colors.amber.shade600),
                        cursorColor: Colors.white,
                        style: kTextStyleFormulario,
                        onChanged: (cervejaria) =>
                            cerveja.cervejaria = cervejaria,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      TextField(
                        controller: cerveja.nome != null
                            ? TextEditingController(text: cerveja.nome)
                            : null,
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: "Nome", fillColor: Colors.amber.shade600),
                        cursorColor: Colors.white,
                        style: kTextStyleFormulario,
                        onChanged: (nome) => cerveja.nome = nome,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      TextField(
                        controller: cerveja.estilo != null
                            ? TextEditingController(text: cerveja.estilo)
                            : null,
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: "Estilo",
                            fillColor: Colors.amber.shade600),
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
                    min: 0,
                    max: 110,
                    divisions: 85,
                    precisao: 0,
                    valor: cerveja.ibu,
                    callback: (double ibu) => cerveja.ibu = ibu,
                  ),
                  SliderAvaliacao(
                    item: "Teor",
                    min: 0,
                    max: 15,
                    divisions: 100,
                    precisao: 1,
                    valor: cerveja.teor,
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
                          flex: 3,
                          child: AvaliacaoCriterio(
                            onChanged: (int odor) {
                              cerveja.odor = odor;
                              setState(() {
                                calculaMedia();
                              });
                            },
                            rating: cerveja.odor,
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
                          flex: 3,
                          child: AvaliacaoCriterio(
                            onChanged: (int sabor) {
                              cerveja.sabor = sabor;
                              setState(() {
                                calculaMedia();
                              });
                            },
                            rating: cerveja.sabor,
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
                          flex: 3,
                          child: AvaliacaoCriterio(
                            onChanged: (int retrogosto) {
                              cerveja.retrogosto = retrogosto;
                              setState(() {
                                calculaMedia();
                              });
                            },
                            rating: cerveja.retrogosto,
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
  final int rating;

  AvaliacaoCriterio({
    this.onChanged,
    this.rating,
  });

  @override
  _AvaliacaoCriterioState createState() => _AvaliacaoCriterioState();
}

class _AvaliacaoCriterioState extends State<AvaliacaoCriterio> {
  int rating;

  @override
  void initState() {
    super.initState();
    rating = widget.rating != null ? widget.rating : 0;
  }

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
  final double valor;

  SliderAvaliacao({
    this.item,
    this.min,
    this.max,
    this.divisions,
    this.precisao,
    this.callback,
    this.valor,
  });

  @override
  _SliderAvaliacaoState createState() => _SliderAvaliacaoState();
}

class _SliderAvaliacaoState extends State<SliderAvaliacao> {
  double valor;

  @override
  void initState() {
    super.initState();
    valor = widget.valor != null ? widget.valor : widget.min;
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
            flex: 9,
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
