import 'package:app_perguntas/componentes/titulo.dart';
import 'package:app_perguntas/componentes/botao.dart';
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  final List<Map<String, Object>> _perguntas = const [
    {
      'Texto': 'Qual sua estação do ano favorita?',
      'Respostas': ['Verão', 'Outono', 'Inverno', 'Primavera']
    },
    {
      'Texto': 'Qual sua cor favorita?',
      'Respostas': ['Resposta 1', 'Resposta 2', 'Resposta 3']
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

  void _responder() {
    if (temPergunta) {
      setState(() {
        _indexPergunta++;
      });
    }
  }

  bool get temPergunta {
    return _indexPergunta < widget._perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> listaRespostas = temPergunta
        ? widget._perguntas[_indexPergunta].cast()['Respostas']
        : [];
    List<Widget> widgetsBotoes = listaRespostas
        .map((e) => Botao(resposta: e, funcao: _responder))
        .toList();
    // for (String r in widget.perguntas[_indexPergunta].cast()['Resposta']) {
    //   resposta.add(Botao(resposta: r, funcao: _responder));
    // }

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
          ? Column(
              children: [
                Titulo(
                    questao:
                        widget._perguntas[_indexPergunta]['Texto'].toString()),
                ...widgetsBotoes,
              ],
            )
          : const Center(
              child: Text(
                'Parabéns',
                style: TextStyle(fontSize: 24),
              ),
            ),
    );
  }
}
