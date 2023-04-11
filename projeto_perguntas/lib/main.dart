import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'package:projeto_perguntas/resultado.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 1},
        {'texto': 'Vermelho', 'pontuacao': 2},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 4},
      ],
    },
    {
      'texto': 'Qual a seu animal favorito?',
      'resposta': [
        {'texto': 'Cobra', 'pontuacao': 2},
        {'texto': 'Capivara', 'pontuacao': 10},
        {'texto': 'Iena', 'pontuacao': 3},
        {'texto': 'Dragão de Comodo', 'pontuacao': 5},
      ],
    },
    {
      'texto': 'Qual o seu herói favorito?',
      'resposta': [
        {'texto': 'Jiraya', 'pontuacao': 5},
        {'texto': 'Jiban', 'pontuacao': 7},
        {'texto': 'Espectroman', 'pontuacao': 8},
        {'texto': 'Changeman', 'pontuacao': 9},
      ],
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Perguntas')),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Resultado(_pontuacaoTotal)),
                    TextButton(
                      onPressed: _reiniciarQuestionario,
                      child: Text(
                        'Jogar Novamente',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    )
                  ],
                ),
          bottomNavigationBar: Container(
            color: Colors.blue,
            child: Text(
              'By Fabinho',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
