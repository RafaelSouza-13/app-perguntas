import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String resposta;
  final void Function() funcao;
  const Botao({required this.resposta, required this.funcao, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: funcao,
        style: TextButton.styleFrom(backgroundColor: Colors.blue),
        child: Text(
          resposta,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
