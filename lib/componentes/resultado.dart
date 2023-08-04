import 'package:app_perguntas/componentes/botao.dart';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final Function() resetar;
  const Resultado({required this.resetar, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Parabéns',
            style: TextStyle(fontSize: 24),
          ),
          Botao(resposta: 'Reiniciar', funcao: resetar),
        ],
      ),
    );
  }
}
