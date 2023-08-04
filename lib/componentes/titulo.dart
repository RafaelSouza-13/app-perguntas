import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  final String questao;
  const Titulo({required this.questao, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questao,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
