import 'jogo.dart';

class MidiaFisica extends Jogo {
    double valorFrete;
    String tipoEmbalagem;

    MidiaFisica(
    {
    required super.id,
    required super.nome,
    required super.genero,
    required super.preco,
    required super.espacoArmazenamento,
    required super.anoLancamento,
    super.disponivel,
    super.dataCadastro,
    
    required this.valorFrete,
    required this.tipoEmbalagem,
    });

    @override
    String ficha() {
        return '${super.ficha()} | Frete: R\$ ${valorFrete.toStringAsFixed(2)} | Embalagem: $tipoEmbalagem';
    }
}