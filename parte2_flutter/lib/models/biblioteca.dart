import 'jogo.dart';
import 'midia_fisica.dart';
import 'midia_online.dart';

class Biblioteca {
  final String nome;

  final List<Jogo> _jogos = [];

  Biblioteca({
    required this.nome,
  });

  void adicionar(Jogo jogo) {
    _jogos.add(jogo);
  }

  List<Jogo> get jogos => List.unmodifiable(_jogos);

  int get quantidadeJogos => _jogos.length;

  double get valorTotalAcervo {
    double total = 0;

    for (final jogo in _jogos) {
      total += jogo.preco;
    }

    return total;
  }

  static Biblioteca inicial() {
    final biblioteca = Biblioteca(
      nome: 'Acervo Pessoal',
    );

    biblioteca.adicionar(
      Jogo(
        id: 'J01',
        nome: 'Stardew Valley',
        genero: 'Simulação',
        preco: 29.90,
        espacoArmazenamento: 2,
        anoLancamento: 2016,
      ),
    );

    biblioteca.adicionar(
      MidiaFisica(
        id: 'J02',
        nome: 'Elden Ring',
        genero: 'RPG de Ação',
        preco: 249.90,
        espacoArmazenamento: 60,
        anoLancamento: 2022,
        valorFrete: 25.00,
        tipoEmbalagem: 'Steelbook',
      ),
    );

    biblioteca.adicionar(
      MidiaOnline(
        id: 'J03',
        nome: 'Hollow Knight',
        genero: 'Metroidvania',
        preco: 49.90,
        espacoArmazenamento: 10,
        anoLancamento: 2017,
        plataforma: 'Steam / PC',
        requerConexaoConstante: true,
      ),
    );

    biblioteca.adicionar(
      Jogo(
        id: 'J04',
        nome: 'Hades',
        genero: 'Roguelike',
        preco: 73.99,
        espacoArmazenamento: 15,
        anoLancamento: 2020,
      ),
    );

    biblioteca.adicionar(
      MidiaOnline(
        id: 'J05',
        nome: 'The Legend of Zelda: Tears of the Kingdom',
        genero: 'Aventura',
        preco: 299.90,
        espacoArmazenamento: 18,
        anoLancamento: 2023,
        plataforma: 'Nintendo Switch',
        requerConexaoConstante: false,
      ),
    );

    biblioteca.adicionar(
      Jogo(
        id: 'J06',
        nome: 'Celeste',
        genero: 'Plataforma',
        preco: 36.99,
        espacoArmazenamento: 1,
        anoLancamento: 2018,
      ),
    );

    return biblioteca;
  }
}