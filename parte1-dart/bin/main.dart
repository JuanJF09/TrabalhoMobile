import 'models/jogo.dart';
import 'models/midia_fisica.dart';
import 'models/midia_online.dart';
import 'models/biblioteca.dart';

void main(List<String> arguments) {
  final jogoBase = Jogo(
    id: 'J01',
    nome: 'Jogo Base',
    genero: 'Padrão',
    preco: 0.00,
    espacoArmazenamento: 1,
    anoLancamento: 2020,
  );

  final jogoFisico = MidiaFisica(
    id: 'J02',
    nome: 'Elden Ring',
    genero: 'RPG de Ação',
    preco: 249.90,
    espacoArmazenamento: 60,
    anoLancamento: 2022,
    valorFrete: 25.00,
    tipoEmbalagem: 'Steelbook Edição de Colecionador',
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

  print('===== [1] ENTIDADE PRINCIPAL =====');
  print(jogoBase.ficha());

  print('\n===== [2] HERANÇA =====');
  print('Jogo comum   -> ${jogoBase.ficha()}');
  print('MidiaFisica  -> ${jogoFisico.ficha()}');
  print('MidiaOnline  -> ${jogoOnline.ficha()}');

  final biblioteca = Biblioteca(nome: 'Acervo Pessoal');
  biblioteca.adicionar(jogoBase);
  biblioteca.adicionar(jogoFisico);
  biblioteca.adicionar(jogoOnline);

  print('\n===== [3] COMPOSIÇÃO =====');
  biblioteca.listarJogos();

  print('\n===== [4] ENCAPSULAMENTO =====');
  print(
    'Valor total do acervo (antes): R\$ ${biblioteca.valorTotalAcervo.toStringAsFixed(2)}',
  );
  final jogoExtra = MidiaOnline(
    id: 'J04',
    nome: 'Hades',
    genero: 'Roguelike',
    preco: 79.90,
    espacoArmazenamento: 15,
    anoLancamento: 2020,
    plataforma: 'Steam / PC',
    requerConexaoConstante: false,
  );
  biblioteca.adicionar(jogoExtra);
  print(
    'Após adicionar "${jogoExtra.nome}" (${jogoExtra.preco.toStringAsFixed(2)}): '
    'R\$ ${biblioteca.valorTotalAcervo.toStringAsFixed(2)}',
  );
}
