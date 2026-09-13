import 'package:flutter/material.dart';
import '../models/jogo.dart';
import '../models/midia_fisica.dart';
import '../models/midia_online.dart';

class DetalhePage extends StatelessWidget {
  final Jogo jogo;

  DetalhePage({super.key, required this.jogo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(jogo.nome)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(jogo.nome, style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 4),
            Text(jogo.genero, style: TextStyle(color: Colors.grey)),
            Divider(height: 32),

            _linha('Ano de lançamento', '${jogo.anoLancamento}'),
            _linha('Espaço de armazenamento', '${jogo.espacoArmazenamento} GB'),
            _linha('Disponível', jogo.disponivel ? 'Sim' : 'Não'),
            _linha('Cadastrado em', _formatarData(jogo.dataCadastro)),

            if (jogo is MidiaFisica) ...[
              Divider(height: 32),
              Text(
                'Mídia física',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              _linha(
                'Valor do frete',
                'R\$ ${(jogo as MidiaFisica).valorFrete.toStringAsFixed(2)}',
              ),
              _linha('Embalagem', (jogo as MidiaFisica).tipoEmbalagem),
            ],

            if (jogo is MidiaOnline) ...[
              Divider(height: 32),
              Text(
                'Mídia online',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              _linha('Plataforma', (jogo as MidiaOnline).plataforma),
              _linha(
                'Requer conexão constante',
                (jogo as MidiaOnline).requerConexaoConstante ? 'Sim' : 'Não',
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _linha(String rotulo, String valor) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$rotulo: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(valor),
        ],
      ),
    );
  }

  String _formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/'
        '${data.month.toString().padLeft(2, '0')}/${data.year}';
  }
}
