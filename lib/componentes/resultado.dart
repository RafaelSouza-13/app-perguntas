import 'package:app_perguntas/componentes/botao.dart';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final Function() resetar;
  final int pontuacao;
  const Resultado({required this.resetar, required this.pontuacao, super.key});

  String get frase {
    if (pontuacao == 40) {
      return 'Impressionante, voce acertou tudo';
    } else if (pontuacao < 40 && pontuacao > 10) {
      return 'Muito bom';
    } else {
      return 'Parabéns';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            frase,
            style: const TextStyle(fontSize: 24),
          ),
          Botao(resposta: 'Reiniciar', funcao: resetar),
        ],
      ),
    );
  }
}
