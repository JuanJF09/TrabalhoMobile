import 'package:flutter/material.dart';
import '../models/jogo.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _nomeController = TextEditingController();
  final _generoController = TextEditingController();
  final _precoController = TextEditingController();

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

    final preco =
        double.tryParse(_precoController.text.replaceAll(',', '.')) ?? 0.0;

    if (nome.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Informe o nome do jogo.')));
      return;
    }

    final novoJogo = Jogo(
      id: 'J${DateTime.now().millisecondsSinceEpoch}',
      nome: nome,
      genero: genero.isEmpty ? 'Não informado' : genero,
      preco: preco,
      espacoArmazenamento: 1,
      anoLancamento: DateTime.now().year,
    );

    Navigator.of(context).pop(novoJogo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar jogo')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome do jogo',
                prefixIcon: Icon(Icons.videogame_asset),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _generoController,
              decoration: InputDecoration(
                labelText: 'Gênero',
                prefixIcon: Icon(Icons.category),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _precoController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Preço (R\$)',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: _confirmar,
              icon: Icon(Icons.check),
              label: Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}
