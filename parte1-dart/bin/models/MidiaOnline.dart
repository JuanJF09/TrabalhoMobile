import 'Jogo.dart';

class MidiaOnline extends Jogo {
  String plataforma;
  bool requerConexaoConstante;

  MidiaOnline({
    required super.id,
    required super.nome,
    required super.genero,
    required super.preco,
    required super.espacoArmazenamento,
    required super.anoLancamento,
    super.disponivel,
    super.dataCadastro,

    required this.plataforma,
    required this.requerConexaoConstante,
  });

  @override
  String ficha() {
    final conexao = requerConexaoConstante ? 'Sim' : 'Não';
    return '${super.ficha()} | Plataforma: $plataforma | Conexão Constante: $conexao';
  }
}
