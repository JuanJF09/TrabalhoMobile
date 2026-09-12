import 'models/Jogo.dart';
import 'models/MidiaFisica.dart';
import 'models/MidiaOnline.dart';
import 'models/Biblioteca.dart';

void main(List<String> arguments) {
  final jogoBase = Jogo(
    id: 'J01',
    nome: 'Jogo Base',
    genero: 'padrao',
    preco: 0.00,
    espacoArmazenamento: 1,
    anoLancamento: 0000,
  );

  final jogoFisico = MidiaFisica(
    id: 'J02',
    nome: 'Elden Ring',
    genero: 'RPG de Acao',
    preco: 249.90,
    espacoArmazenamento: 60,
    anoLancamento: 2022,
    valorFrete: 25.00,
    tipoEmbalagem: 'Steelbook Edicao de Colecionador',
  );

  final jogoOnline = MidiaOnline(
    id: 'J03',
    nome: 'Hollow Knight',
    genero: 'RPG de Acao',
    preco: 49.90,
    espacoArmazenamento: 10,
    anoLancamento: 2017,
    plataforma: 'Steam / PC',
    requerConexaoConstante: true,
  );

  print('=== Exercício 2: ficha() na classe base e nas subclasses  ===');
  print(jogoBase.ficha()); // saída do método na classe base (Jogo)
  print(jogoFisico.ficha()); // saída do método sobrescrito (MidiaFisica)
  print(jogoOnline.ficha()); // saída do método sobrescrito (MidiaOnline)

  print('');
  final biblioteca = Biblioteca(nome: 'Acervo Pessoal');

  print('\n=== Exercício 4: getter calculado antes de adicionar ===');
  print('Quantidade de jogos: ${biblioteca.quantidadeJogos}');
  print(
    'Valor total do acervo: R\$ ${biblioteca.valorTotalAcervo.toStringAsFixed(2)}',
  );

  biblioteca.adicionar(jogoBase);
  biblioteca.adicionar(jogoFisico);
  biblioteca.adicionar(jogoOnline);

  print('\n=== Exercício 4: getter calculado depois de adicionar ===');
  print('Quantidade de jogos: ${biblioteca.quantidadeJogos}');
  print(
    'Valor total do acervo: R\$ ${biblioteca.valorTotalAcervo.toStringAsFixed(2)}',
  );

  print('\n=== Exercício 3: itens contidos na Biblioteca ===');
  biblioteca.listarJogos();
}
