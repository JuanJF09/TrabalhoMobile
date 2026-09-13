import 'jogo.dart';

class Catalogo {
  final List<Jogo> _jogos = [];

  void adicionarJogo(Jogo jogo) {
    _jogos.add(jogo);
  }

  void removerJogo(String id) {
    _jogos.removeWhere((jogo) => jogo.id == id);
  }

  List<Jogo> get jogos => _jogos;

  int get quantidadeJogos => _jogos.length;
}