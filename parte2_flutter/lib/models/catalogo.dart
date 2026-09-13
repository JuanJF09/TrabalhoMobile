import 'jogo.dart';

class Catalogo {
  final List<Jogo> jogos = [];

  void adicionarJogo(Jogo jogo) {
    jogos.add(jogo);
  }
}