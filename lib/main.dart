import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> perguntas = [
    'Qual sua cor favorita?',
    'Qual sua estação do ano favorita?'
  ];

  int _indexPergunta = 0;

  void _responder() {
    setState(() {
      _indexPergunta++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Perguntas',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Text(perguntas[_indexPergunta]),
          FilledButton(
            onPressed: _responder,
            child: const Text('Resposta 1'),
          ),
          FilledButton(
            onPressed: _responder,
            child: const Text('Resposta 2'),
          ),
          FilledButton(
            onPressed: _responder,
            child: const Text('Resposta 3'),
          )
        ],
      ),
    );
  }
}