import 'package:flutter/material.dart';

import '../models/jogo.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _nomeController =
      TextEditingController();

  final TextEditingController _generoController =
      TextEditingController();

  final TextEditingController _precoController =
      TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _generoController.dispose();
    _precoController.dispose();

    super.dispose();
  }

  void _confirmar() {
    final nome = _nomeController.text.trim();
    final genero = _generoController.text.trim();

    final precoTexto = _precoController.text
        .trim()
        .replaceAll(',', '.');

    final preco = double.tryParse(precoTexto);

    if (nome.isEmpty || genero.isEmpty || preco == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Preencha todos os campos corretamente.',
          ),
        ),
      );

      return;
    }

    final novoJogo = Jogo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      nome: nome,
      genero: genero,
      preco: preco,
      espacoArmazenamento: 1,
      anoLancamento: DateTime.now().year,
    );

    Navigator.of(context).pop(novoJogo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Jogo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome do jogo',
                prefixIcon: const Icon(Icons.videogame_asset),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: _generoController,
              decoration: InputDecoration(
                labelText: 'Gênero',
                prefixIcon: const Icon(Icons.category),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: _precoController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                labelText: 'Preço',
                prefixIcon: const Icon(Icons.attach_money),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _confirmar,
                icon: const Icon(Icons.check),
                label: const Text('Confirmar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}