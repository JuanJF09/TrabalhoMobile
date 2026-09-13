import 'models/jogo.dart';
import 'models/midiafisica.dart';
import 'models/midiaonline.dart';
import 'models/biblioteca.dart';

void main() {
  final jogoBase = Jogo(
    id: 'J01',
    nome: 'Stardew Valley',
    genero: 'Simulação',
    preco: 29.90,
    espacoArmazenamento: 2,
    anoLancamento: 2016,
  );

  final jogoFisico = MidiaFisica(
    id: 'J02',
    nome: 'Elden Ring',
    genero: 'RPG de Ação',
    preco: 249.90,
    espacoArmazenamento: 60,
    anoLancamento: 2022,
    valorFrete: 25.00,
    tipoEmbalagem: 'Steelbook',
  );

  final jogoOnline = MidiaOnline(
    id: 'J03',
    nome: 'Hollow Knight',
    genero: 'Metroidvania',
    preco: 49.90,
    espacoArmazenamento: 10,
    anoLancamento: 2017,
    plataforma: 'Steam / PC',
    requerConexaoConstante: true,
  );

  // =========================================================
  // [1] ENTIDADE PRINCIPAL
  // =========================================================

  print('===== [1] ENTIDADE PRINCIPAL =====');

  print('Nome: ${jogoBase.nome}');
  print('Gênero: ${jogoBase.genero}');
  print('Preço: R\$ ${jogoBase.preco.toStringAsFixed(2)}');
  print('Armazenamento: ${jogoBase.espacoArmazenamento} GB');
  print('Ano: ${jogoBase.anoLancamento}');
  print('Disponível: ${jogoBase.disponivel}');

  // =========================================================
  // [2] HERANÇA
  // =========================================================

  print('\n===== [2] HERANÇA =====');

  print('Jogo -> ficha()');
  print(jogoBase.ficha());

  print('\nMidiaFisica -> ficha()');
  print(jogoFisico.ficha());

  print('\nMidiaOnline -> ficha()');
  print(jogoOnline.ficha());

  // =========================================================
  // [3] COMPOSIÇÃO
  // =========================================================

  final biblioteca = Biblioteca(
    nome: 'Acervo Pessoal',
  );

  biblioteca.adicionar(jogoBase);
  biblioteca.adicionar(jogoFisico);
  biblioteca.adicionar(jogoOnline);

  print('\n===== [3] COMPOSIÇÃO =====');

  print(
    'Biblioteca "${biblioteca.nome}" '
    'contém ${biblioteca.quantidadeJogos} jogos:',
  );

  for (final jogo in biblioteca.jogos) {
    print('- ${jogo.nome}');
  }

  // =========================================================
  // [4] ENCAPSULAMENTO
  // =========================================================

  final bibliotecaTeste = Biblioteca(
    nome: 'Teste de Encapsulamento',
  );

  print('\n===== [4] ENCAPSULAMENTO =====');

  print(
    'Antes de adicionar: '
    'R\$ ${bibliotecaTeste.valorTotalAcervo.toStringAsFixed(2)}',
  );

  bibliotecaTeste.adicionar(jogoFisico);

  print(
    'Depois de adicionar: '
    'R\$ ${bibliotecaTeste.valorTotalAcervo.toStringAsFixed(2)}',
  );
}