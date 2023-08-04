import 'package:app_perguntas/componentes/titulo.dart';
import 'package:flutter/material.dart';
import 'package:app_perguntas/componentes/botao.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final Function() quandoResponder;
  const Questionario(
      {required this.perguntas,
      required this.perguntaSelecionada,
      required this.quandoResponder,
      super.key});

  bool get temPergunta {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> listaRespostas =
        temPergunta ? perguntas[perguntaSelecionada].cast()['Respostas'] : [];
    List<Widget> widgetsBotoes = listaRespostas
        .map((resp) =>
            Botao(resposta: resp['Texto'].toString(), funcao: quandoResponder))
        .toList();
    final String questao = perguntas[perguntaSelecionada]['Texto'].toString();
    // for (String r in widget.perguntas[_indexPergunta].cast()['Resposta']) {
    //   resposta.add(Botao(resposta: r, funcao: _responder));
    // }
    return Column(
      children: [
        Titulo(questao: questao),
        ...widgetsBotoes,
      ],
    );
  }
}
