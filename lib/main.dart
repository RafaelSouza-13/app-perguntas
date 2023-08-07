import 'package:app_perguntas/componentes/questionario.dart';
import 'package:app_perguntas/componentes/resultado.dart';
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
  final List<Map<String, Object>> _perguntas = const [
    {
      'Texto': 'De quem é a famosa frase “Penso, logo existo”?',
      'Respostas': [
        {'Texto': 'Platão', 'pontuacao': 0},
        {'Texto': 'Galileu Galilei', 'pontuacao': 0},
        {'Texto': 'Descartes', 'pontuacao': 10},
        {'Texto': 'Sócrates', 'pontuacao': 0},
      ]
    },
    {
      'Texto': 'De onde é a invenção do chuveiro elétrico?',
      'Respostas': [
        {'Texto': 'França', 'pontuacao': 0},
        {'Texto': 'Inglaterra', 'pontuacao': 0},
        {'Texto': 'Brasil', 'pontuacao': 10},
        {'Texto': 'Austrália', 'pontuacao': 0},
      ]
    },
    {
      'Texto': 'Quais o menor e o maior país do mundo?',
      'Respostas': [
        {'Texto': 'Vaticano e Rússia', 'pontuacao': 10},
        {'Texto': 'Nauru e China', 'pontuacao': 0},
        {'Texto': 'Mônaco e Canadá', 'pontuacao': 0},
        {'Texto': 'Malta e Estados Unidos', 'pontuacao': 0}
      ]
    },
    {
      'Texto': 'Qual o livro mais vendido no mundo a seguir à Bíblia?',
      'Respostas': [
        {'Texto': 'O Senhor dos Anéis', 'pontuacao': 0},
        {'Texto': 'Dom Quixote', 'pontuacao': 10},
        {'Texto': 'O Pequeno Príncipe', 'pontuacao': 0},
        {'Texto': 'Ela, a Feiticeira', 'pontuacao': 0},
      ]
    },
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// for(String textoResp in perguntas[_perguntaSelecionada].cast()['respostas']) {
//       respostas.add(Resposta(textoResp, _responder));
//     }
class _MyHomePageState extends State<MyHomePage> {
  int _indexPergunta = 0;
  int _pontuacaoTotal = 0;

  void _reiniciar() {
    setState(() {
      _indexPergunta = 0;
      _pontuacaoTotal = 0;
    });
  }

  void _responder(int pontuacao) {
    if (temPergunta) {
      setState(() {
        _indexPergunta++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  bool get temPergunta {
    return _indexPergunta < widget._perguntas.length;
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
      body: temPergunta
          ? Questionario(
              perguntas: widget._perguntas,
              perguntaSelecionada: _indexPergunta,
              quandoResponder: _responder,
            )
          : Resultado(
              resetar: _reiniciar,
              pontuacao: _pontuacaoTotal,
            ),
    );
  }
}
