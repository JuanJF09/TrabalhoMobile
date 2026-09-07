import 'models/MidiaFisica.dart';
import 'models/MidiaOnline.dart';

void main(List<String> arguments) {

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
    nome: 'Elden Ring',
    genero: 'RPG de Acao',
    preco: 229.90,
    espacoArmazenamento: 60,
    anoLancamento: 2022,
    plataforma: 'Steam / PC',
    requerConexaoConstante: true,
  );

  print(jogoFisico.ficha());
  print(jogoOnline.ficha());
}
