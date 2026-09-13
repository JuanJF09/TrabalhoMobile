import 'package:flutter/material.dart';

import '../models/biblioteca.dart';
import '../models/jogo.dart';
import 'cadastro_page.dart';
import 'detalhe_page.dart';
import 'widgets/cartao.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Biblioteca _biblioteca = Biblioteca.inicial();

  Future<void> _abrirCadastro() async {
    final novoJogo = await Navigator.of(context).push<Jogo>(
      MaterialPageRoute(
        builder: (context) => const CadastroPage(),
      ),
    );

    if (novoJogo == null) {
      return;
    }

    setState(() {
      _biblioteca.adicionar(novoJogo);
    });
  }

  void _abrirDetalhes(Jogo jogo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetalhePage(
          jogo: jogo,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acervo de Jogos'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Valor total do acervo',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'R\$ ${_biblioteca.valorTotalAcervo.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${_biblioteca.quantidadeJogos} jogos cadastrados',
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _biblioteca.quantidadeJogos,
              itemBuilder: (context, index) {
                final jogo = _biblioteca.jogos[index];

                return Cartao(
                  jogo: jogo,
                  onTap: () => _abrirDetalhes(jogo),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirCadastro,
        child: const Icon(Icons.add),
      ),
    );
  }
}