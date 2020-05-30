import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemGerada = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUser) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do User: " + escolhaUser);

    //exibição da imagem escolhida pelo app
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemGerada = AssetImage("images/pedra.png");
        });
        break;

      case "papel":
        setState(() {
          this._imagemGerada = AssetImage("images/papel.png");
        });
        break;

      case "tesoura":
        setState(() {
          this._imagemGerada = AssetImage("images/tesoura.png");
        });
        break;
    }

    //validando o ganhador
    if ((escolhaUser == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUser == "tesoura" && escolhaApp == "papel") ||
        (escolhaUser == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Venceu";
      });
    } else if ((escolhaUser == "tesoura" && escolhaApp == "pedra") ||
        (escolhaUser == "papel" && escolhaApp == "tesoura") ||
        (escolhaUser == "pedra" && escolhaApp == "papel")) {
      setState(() {
        this._mensagem = "App Venceu";
      });
    } else {
      setState(() {
        this._mensagem = "Empate";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JoKenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //text
          //imagem
          //texto resultado
          //linha 3 imagens
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: this._imagemGerada),
          //vai usar o widget de controle da tela
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "images/pedra.png",
                  height: 95,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  "images/papel.png",
                  height: 95,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "images/tesoura.png",
                  height: 95,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
