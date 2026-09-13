import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Acervo de Jogos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true, brightness: Brightness.dark),
      home: HomePage(),
    );
  }
}
