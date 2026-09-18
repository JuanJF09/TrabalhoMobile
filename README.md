# Trabalho do 1º Bimestre — Programação para Dispositivos Móveis

**Integrantes:** 
Caio Felipe Braga de Oliveira — RA: 252579-2024

Juan

## Domínio

O tema escolhido é um **acervo de jogos**. A entidade individual é `Jogo`
(um jogo, com nome, gênero, preço, espaço de armazenamento, ano de
lançamento e data de cadastro), especializado em `MidiaFisica` (jogo em
mídia física, com valor de frete e tipo de embalagem) e `MidiaOnline`
(jogo digital, com plataforma e exigência de conexão constante). A
entidade agrupadora é `Biblioteca`, que contém uma lista de `Jogo` e
expõe a quantidade de itens e o valor total do acervo.

**Por que `Biblioteca` tem uma lista de `Jogo` (composição) em vez de
herdar dele:** uma biblioteca não é um tipo especializado de jogo — a
frase "toda Biblioteca é um Jogo" não faz sentido. A relação real é
"a Biblioteca **tem** vários jogos", ou seja, ela agrupa objetos de
outra classe sem ser um deles. Por isso a relação é modelada como
composição (`List<Jogo>` dentro de `Biblioteca`), e não como herança.

## Tabela de rastreio

| # | Exercício | Arquivo e linha | O que aparece na tela |
|---|---|---|---|
| 1 | Entidade principal | `parte1-dart/bin/models/jogo.dart:1` | Bloco `[1]` do relatório |
| 2 | Herança | `parte1-dart/bin/models/midia_fisica.dart:3` e `midia_online.dart:3` | Bloco `[2]` do relatório |
| 3 | Composição | `parte1-dart/bin/models/biblioteca.dart:3` | Bloco `[3]` do relatório |
| 4 | Encapsulamento | `parte1-dart/bin/models/biblioteca.dart:5` (campo) e `:17` (getter) | Bloco `[4]` e o total no topo da tela de lista |
| 5 | Estrutura de tela | `parte2-flutter/lib/screens/home_page.dart:95` | AppBar e corpo da tela inicial |
| 6 | Cartão | `parte2-flutter/lib/screens/widgets/cartao.dart:22` | Cada item da lista |
| 7 | Lista | `parte2-flutter/lib/screens/home_page.dart:133` | Lista rolável com seis itens |
| 8 | Navegação | `parte2-flutter/lib/screens/home_page.dart:141` | Toque no item abre o detalhe |
| 9 | Formulário | `parte2-flutter/lib/screens/cadastro_page.dart:69` | Tela de cadastro |
| 10 | Estado | `parte2-flutter/lib/screens/home_page.dart:88` | Item novo na lista e total atualizado |

> As linhas acima refletem os arquivos deste pacote. Se você mover ou
> editar código depois, confira e ajuste os números de linha antes de
> entregar — a tabela precisa refletir o código real.

## Como rodar

**Parte 1:**
```
cd parte1-dart
dart run
```

**Parte 2:**
```
cd parte2-flutter
flutter run
```
