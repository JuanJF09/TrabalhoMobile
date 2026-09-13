import 'Jogo.dart';

class Biblioteca {
  final String nome;

  final List<Jogo> _jogos = [];

  Biblioteca({
    required this.nome,
  });

  void adicionar(Jogo jogo) {
    _jogos.add(jogo);
  }

  int get quantidadeJogos => _jogos.length;

  double get valorTotalAcervo {
    double total = 0;

    for (final jogo in _jogos) {
      total += jogo.preco;
    }

    return total;
  }

  List<Jogo> get jogos => List.unmodifiable(_jogos);

  void listarJogos() {
    print('Biblioteca: $nome');
    print('Quantidade: ${_jogos.length}');

    for (final jogo in _jogos) {
      print('- ${jogo.nome}');
    }
  }
}