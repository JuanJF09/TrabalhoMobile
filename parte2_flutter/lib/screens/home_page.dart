import 'package:flutter/material.dart';
import '../models/biblioteca.dart';
import '../models/jogo.dart';
import '../models/midia_fisica.dart';
import '../models/midia_online.dart';
import 'widgets/cartao.dart';
import 'detalhe_page.dart';
import 'cadastro_page.dart';

/// StatefulWidget porque, ao cadastrar um jogo novo, precisamos avisar o
/// Flutter que o estado mudou (exercício 10) para a tela se redesenhar.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Objeto agrupador do exercício 3, já criado com seis itens.
  // É dele que saem a lista e o total — nada aqui é lido de campos soltos.
  final Biblioteca _biblioteca = Biblioteca(nome: 'Acervo Pessoal')
    ..adicionar(
      Jogo(
        id: 'J01',
        nome: 'Stardew Valley',
        genero: 'Simulação',
        preco: 29.90,
        espacoArmazenamento: 2,
        anoLancamento: 2016,
      ),
    )
    ..adicionar(
      MidiaFisica(
        id: 'J02',
        nome: 'Elden Ring',
        genero: 'RPG de Ação',
        preco: 249.90,
        espacoArmazenamento: 60,
        anoLancamento: 2022,
        valorFrete: 25.00,
        tipoEmbalagem: 'Steelbook Edição de Colecionador',
      ),
    )
    ..adicionar(
      MidiaOnline(
        id: 'J03',
        nome: 'Hollow Knight',
        genero: 'Metroidvania',
        preco: 49.90,
        espacoArmazenamento: 10,
        anoLancamento: 2017,
        plataforma: 'Steam / PC',
        requerConexaoConstante: false,
      ),
    )
    ..adicionar(
      MidiaOnline(
        id: 'J04',
        nome: 'Hades',
        genero: 'Roguelike',
        preco: 79.90,
        espacoArmazenamento: 15,
        anoLancamento: 2020,
        plataforma: 'Steam / PC',
        requerConexaoConstante: false,
      ),
    )
    ..adicionar(
      MidiaFisica(
        id: 'J05',
        nome: 'The Legend of Zelda: TOTK',
        genero: 'Aventura',
        preco: 299.90,
        espacoArmazenamento: 18,
        anoLancamento: 2023,
        valorFrete: 18.50,
        tipoEmbalagem: 'Caixa padrão',
      ),
    )
    ..adicionar(
      Jogo(
        id: 'J06',
        nome: 'Celeste',
        genero: 'Plataforma',
        preco: 39.90,
        espacoArmazenamento: 1,
        anoLancamento: 2018,
      ),
    );

  Future<void> _abrirCadastro() async {
    final novoJogo = await Navigator.of(
      context,
    ).push<Jogo>(MaterialPageRoute(builder: (_) => const CadastroPage()));

    if (novoJogo != null) {
      // O item entra na lista privada da Biblioteca. Fora do setState,
      // a lista mudaria nos bastidores, mas a tela não saberia disso.
      setState(() {
        _biblioteca.adicionar(novoJogo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Biblioteca de Jogos'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.indigo,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Total do acervo',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(
                  'R\$ ${_biblioteca.valorTotalAcervo.toStringAsFixed(2)}  '
                  '(${_biblioteca.quantidadeJogos} jogos)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8),
              itemCount: _biblioteca.quantidadeJogos,
              itemBuilder: (context, index) {
                final jogo = _biblioteca.jogos[index];
                return Cartao(
                  jogo: jogo,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetalhePage(jogo: jogo),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _abrirCadastro,
        icon: Icon(Icons.add),
        label: Text('Cadastrar'),
      ),
    );
  }
}
