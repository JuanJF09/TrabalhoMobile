import 'package:flutter/material.dart';

import '../models/jogo.dart';
import '../models/midia_fisica.dart';
import '../models/midia_online.dart';

class DetalhePage extends StatelessWidget {
  final Jogo jogo;

  const DetalhePage({
    super.key,
    required this.jogo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Jogo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              jogo.nome,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            _informacao(
              'Gênero',
              jogo.genero,
            ),

            _informacao(
              'Ano de lançamento',
              jogo.anoLancamento.toString(),
            ),

            _informacao(
              'Armazenamento',
              '${jogo.espacoArmazenamento} GB',
            ),

            _informacao(
              'Disponível',
              jogo.disponivel ? 'Sim' : 'Não',
            ),

            _informacao(
              'Data de cadastro',
              '${jogo.dataCadastro.day.toString().padLeft(2, '0')}/'
              '${jogo.dataCadastro.month.toString().padLeft(2, '0')}/'
              '${jogo.dataCadastro.year}',
            ),

            const SizedBox(height: 16),

            if (jogo is MidiaFisica) ...[
              _informacao(
                'Frete',
                'R\$ ${(jogo as MidiaFisica).valorFrete.toStringAsFixed(2)}',
              ),
              _informacao(
                'Embalagem',
                (jogo as MidiaFisica).tipoEmbalagem,
              ),
            ],

            if (jogo is MidiaOnline) ...[
              _informacao(
                'Plataforma',
                (jogo as MidiaOnline).plataforma,
              ),
              _informacao(
                'Conexão constante',
                (jogo as MidiaOnline).requerConexaoConstante
                    ? 'Sim'
                    : 'Não',
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _informacao(String titulo, String valor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        '$titulo: $valor',
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
    );
  }
}