class Jogo {
  String id;
  String nome;
  String genero;
  double preco;
  int espacoArmazenamento;
  int anoLancamento;
  bool disponivel;
  DateTime dataCadastro;

  Jogo({
    required this.id,
    required this.nome,
    required this.genero,
    required this.preco,
    required this.espacoArmazenamento,
    required this.anoLancamento,
    this.disponivel = true,
    DateTime? dataCadastro,
  }) : dataCadastro = dataCadastro ?? DateTime.now();

  String ficha() {
    return '$nome ($anoLancamento) - Gênero: $genero | Preço: R\$ ${preco.toStringAsFixed(2)} | Tamanho: ${espacoArmazenamento}GB';
  }
}
