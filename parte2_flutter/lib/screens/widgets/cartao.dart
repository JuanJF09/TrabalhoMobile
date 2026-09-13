import 'package:flutter/material.dart';
import '../../models/jogo.dart';

/// Cartão que exibe os dados de UM jogo, estilizado com BoxDecoration.
/// É reaproveitado dentro do ListView.builder do exercício 7.
class Cartao extends StatelessWidget {
  final Jogo jogo;
  final VoidCallback? onTap;

  Cartao({super.key, required this.jogo, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: EdgeInsets.all(14),
        // Container não aceita `color` junto de `decoration`: a cor vai
        // dentro do BoxDecoration.
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.indigo,
              child: Text(
                jogo.nome.isNotEmpty ? jogo.nome[0].toUpperCase() : '?',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jogo.nome,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(jogo.genero, style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Text(
              'R\$ ${jogo.preco.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
