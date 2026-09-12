import 'Jogo.dart';

class Biblioteca {
  final String nome;
  final List<Jogo> _jogos = [];

  Biblioteca({required this.nome});

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

  void listarJogos() {
    print('--- Acervo de $nome (${_jogos.length} jogo(s)) ---');
    for (final jogo in _jogos) {
      print(jogo.ficha());
    }
  }
}
