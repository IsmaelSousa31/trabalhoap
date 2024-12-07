import 'dart:math';
import 'package:flutter/material.dart';

// Tela Inicial
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu Inicial')),
      body: Container(
        color: Color(0xFF003366), // Adicionando fundo azul marinho
        child: Center( // Envolve o Column com Center
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza os botões verticalmente
            children: <Widget>[
              // Mensagem de "Seja Bem-Vindo"
              Text(
                'Seja Bem-Vindo',
                style: TextStyle(
                  color: Colors.white, // Cor do texto em branco
                  fontSize: 24, // Tamanho da fonte
                  fontWeight: FontWeight.bold, // Deixar em negrito
                ),
              ),
              SizedBox(height: 30), // Espaço entre a mensagem e os botões

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FuelChoiceScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Aumenta o tamanho do botão
                  textStyle: TextStyle(fontSize: 20), // Aumenta o tamanho da fonte
                ),
                child: Text(
                  'Escolha de Combustível',
                  style: TextStyle(color: Color(0xFF003366)), // Cor do texto igual ao fundo
                ),
              ),
              SizedBox(height: 20), // Espaço entre os botões
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DailyPhraseScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 20),
                ),
                child: Text(
                  'Frase do Dia',
                  style: TextStyle(color: Color(0xFF003366)),
                ),
              ),
              SizedBox(height: 20), // Espaço entre os botões
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 20),
                ),
                child: Text(
                  'Tela de Jogos',
                  style: TextStyle(color: Color(0xFF003366)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class FuelChoiceScreen extends StatefulWidget {
  @override
  _FuelChoiceScreenState createState() => _FuelChoiceScreenState();
}

class _FuelChoiceScreenState extends State<FuelChoiceScreen> {
  final _alcoolController = TextEditingController();
  final _gasolinaController = TextEditingController();
  String result = "";

  void calculateBestChoice() {
    double alcool = double.tryParse(_alcoolController.text) ?? 0;
    double gasolina = double.tryParse(_gasolinaController.text) ?? 0;

    if (alcool == 0 || gasolina == 0) {
      setState(() {
        result = "Por favor, insira valores válidos!";
      });
      return;
    }

    if (gasolina - alcool <= 1) {
      setState(() {
        result = "A melhor escolha é a Gasolina: R\$${gasolina.toStringAsFixed(2)}";
      });
    } else {
      setState(() {
        result = "A melhor escolha é o Álcool: R\$${alcool.toStringAsFixed(2)}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Escolha de Combustível')),
      body: Container(
        color: Colors.orange, // Cor do fundo (laranja)
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/gasolina.png', width: 100, height: 100), // Imagem no topo
            SizedBox(height: 20),
            // Campo de valor do álcool
            TextField(
              controller: _alcoolController,
              decoration: InputDecoration(
                labelText: 'Valor Álcool',
                filled: true,
                fillColor: Colors.white, // Fundo branco para o campo de texto
                border: OutlineInputBorder(), // Bordas para o campo
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            // Campo de valor da gasolina
            TextField(
              controller: _gasolinaController,
              decoration: InputDecoration(
                labelText: 'Valor Gasolina',
                filled: true,
                fillColor: Colors.white, // Fundo branco para o campo de texto
                border: OutlineInputBorder(), // Bordas para o campo
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            // Botão para calcular a melhor escolha
            ElevatedButton(
              onPressed: calculateBestChoice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Cor de fundo do botão (branco)
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 12), // Botões menores
                minimumSize: Size(double.infinity, 45), // Botões ainda menores
              ),
              child: Text(
                'Ver Melhor Escolha',
                style: TextStyle(
                  color: Colors.orange, // Texto em laranja
                  fontSize: 16, // Fonte ainda menor
                  fontWeight: FontWeight.bold, // Deixa o texto em negrito
                ),
              ),
            ),
            SizedBox(height: 15),
            // Resultado com fundo e fonte ajustada
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.white, // Fundo branco para o resultado
              child: Text(
                result,
                style: TextStyle(
                  color: Colors.orange, // Cor do texto
                  fontSize: 18, // Tamanho um pouco menor
                  fontWeight: FontWeight.bold, // Negrito
                ),
              ),
            ),
            SizedBox(height: 15),
            // Botão de voltar com tamanho de fonte ajustado
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Voltar para o Menu
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Cor de fundo do botão (branco)
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 12), // Botões menores
                minimumSize: Size(double.infinity, 45), // Botões ainda menores
              ),
              child: Text(
                'Voltar',
                style: TextStyle(
                  color: Colors.orange, // Texto em laranja
                  fontSize: 16, // Fonte ainda menor
                  fontWeight: FontWeight.bold, // Deixa o texto em negrito
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DailyPhraseScreen extends StatefulWidget {
  @override
  _DailyPhraseScreenState createState() => _DailyPhraseScreenState();
}

class _DailyPhraseScreenState extends State<DailyPhraseScreen> {
  final List<String> phrases = [
    "A vida é curta, então aproveite cada momento.",
    "O único lugar onde o sucesso vem antes do trabalho é no dicionário.",
    "Acredite nos seus sonhos, mesmo quando ninguém mais acreditar.",
    "O sucesso começa com a confiança em si mesmo.",
    "Cada passo dado é uma vitória sobre o medo",
    "Continue caminhando, a jornada é o que importa.",
    "Desafios existem para provar o quão forte você é.",
    "O impossível é só uma opinião, não uma realidade."
  ];

  String currentPhrase = "";

  void generateNewPhrase() {
    setState(() {
      currentPhrase = phrases[Random().nextInt(phrases.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Frase do Dia')),
      body: Container(
        color: Color(0xFF003366), // Cor de fundo azul escuro
        padding: const EdgeInsets.all(20.0), // Adiciona espaçamento para os elementos
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza os elementos verticalmente
          children: <Widget>[
            Image.asset('assets/frases.png', width: 100, height: 100), // Imagem no topo
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0), // Adiciona espaçamento ao redor da frase
              child: Text(
                currentPhrase.isEmpty
                    ? "Clique no botão para gerar uma frase."
                    : currentPhrase,
                textAlign: TextAlign.center, // Centraliza o texto horizontalmente
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20), // Espaço entre os botões
            ElevatedButton(
              onPressed: generateNewPhrase,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Cor de fundo do botão
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Aumenta o tamanho do botão
                minimumSize: Size(double.infinity, 50), // Tamanho do botão
              ),
              child: Text(
                'Gerar Nova Frase',
                style: TextStyle(
                  color: Color(0xFF003366), // Texto na cor azul escuro
                  fontSize: 16,
                  fontWeight: FontWeight.bold, // Texto em negrito
                ),
              ),
            ),
            SizedBox(height: 20), // Espaço entre os botões
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Voltar para o Menu
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Cor de fundo do botão
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Aumenta o tamanho do botão
                minimumSize: Size(double.infinity, 50), // Tamanho do botão
              ),
              child: Text(
                'Voltar',
                style: TextStyle(
                  color: Color(0xFF003366), // Texto na cor azul escuro
                  fontSize: 16,
                  fontWeight: FontWeight.bold, // Texto em negrito
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Tela de Jogos
class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela de Jogos')),
      body: Container(
        color: Color(0xFF6A0DAD), // Cor roxa para o fundo
        padding: const EdgeInsets.all(20.0), // Espaçamento geral
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
          children: <Widget>[
            // Imagem no topo
            Image.asset('assets/GAME.png', width: 150, height: 150),
            SizedBox(height: 30), // Espaço entre a imagem e os botões

            // Botões com fundo branco e texto roxo
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JokenpoScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Cor de fundo do botão (branco)
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Jokenpô',
                style: TextStyle(
                  color: Color(0xFF6A0DAD), // Texto roxo
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20), // Espaço entre os botões
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CoinTossScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Cor de fundo do botão (branco)
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Cara ou Coroa',
                style: TextStyle(
                  color: Color(0xFF6A0DAD), // Texto roxo
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20), // Espaço entre os botões
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MemoryGameScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Cor de fundo do botão (branco)
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Jogo de Memória',
                style: TextStyle(
                  color: Color(0xFF6A0DAD), // Texto roxo
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30), // Espaço entre os botões
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Voltar para a tela anterior
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Cor de fundo do botão (branco)
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Voltar',
                style: TextStyle(
                  color: Color(0xFF6A0DAD), // Texto roxo
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class JokenpoScreen extends StatefulWidget {
  @override
  _JokenpoScreenState createState() => _JokenpoScreenState();
}

class _JokenpoScreenState extends State<JokenpoScreen> {
  String playerChoice = "";
  String computerChoice = "";
  String result = "";

  void playGame(String choice) {
    playerChoice = choice;
    computerChoice = ['Pedra', 'Papel', 'Tesoura'][Random().nextInt(3)];
    if (playerChoice == computerChoice) {
      result = 'Empate!';
    } else if ((playerChoice == 'Pedra' && computerChoice == 'Tesoura') ||
        (playerChoice == 'Papel' && computerChoice == 'Pedra') ||
        (playerChoice == 'Tesoura' && computerChoice == 'Papel')) {
      result = 'Você Ganhou!';
    } else {
      result = 'Você Perdeu!';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jokenpô')),
      body: Container(
        color: Color(0xFF6A1B9A), // Cor roxa de fundo
        padding: const EdgeInsets.all(15.0), // Reduzindo o espaçamento
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Imagem no topo
            Image.asset('assets/GAME.png', width: 100, height: 100), // Imagem ainda menor
            SizedBox(height: 15),
            Text(
              'Escolha sua jogada:',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset('assets/pedra.png', width: 40, height: 40), // Imagem Pedra
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => playGame('Pedra'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        minimumSize: Size(100, 35),
                      ),
                      child: Text(
                        'Pedra',
                        style: TextStyle(
                          color: Color(0xFF6A1B9A),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 15),
                Column(
                  children: <Widget>[
                    Image.asset('assets/papel.png', width: 40, height: 40), // Imagem Papel
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => playGame('Papel'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        minimumSize: Size(100, 35),
                      ),
                      child: Text(
                        'Papel',
                        style: TextStyle(
                          color: Color(0xFF6A1B9A),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 15),
                Column(
                  children: <Widget>[
                    Image.asset('assets/tesoura.png', width: 40, height: 40), // Imagem Tesoura
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => playGame('Tesoura'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        minimumSize: Size(100, 35),
                      ),
                      child: Text(
                        'Tesoura',
                        style: TextStyle(
                          color: Color(0xFF6A1B9A),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            // Exibe o resultado e as escolhas
            Text(
              'Sua escolha: $playerChoice',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              'Escolha do Computador: $computerChoice',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              'Resultado do Jogo: $result',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 15),
            // Botão de Voltar
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Voltar para a Tela de Jogos
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                minimumSize: Size(120, 35),
              ),
              child: Text(
                'Voltar',
                style: TextStyle(
                  color: Color(0xFF6A1B9A),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CoinTossScreen extends StatefulWidget {
  @override
  _CoinTossScreenState createState() => _CoinTossScreenState();
}

class _CoinTossScreenState extends State<CoinTossScreen> {
  String playerChoice = "";
  String computerChoice = "";
  String result = "";

  void tossCoin(String choice) {
    playerChoice = choice;
    computerChoice = ['Cara', 'Coroa'][Random().nextInt(2)];
    if (playerChoice == computerChoice) {
      result = 'Você Ganhou!';
    } else {
      result = 'Você Perdeu!';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cara ou Coroa')),
      body: Container(
        color: Color(0xFF6A1B9A), // Cor roxa de fundo
        padding: const EdgeInsets.all(15.0), // Adiciona um pouco de espaçamento
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Imagem no topo
            Image.asset('assets/cara.png', width: 120, height: 120), // Imagem aumentada
            SizedBox(height: 15),
            Text(
              'Escolha Cara ou Coroa:',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => tossCoin('Cara'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    minimumSize: Size(150, 50),
                  ),
                  child: Text(
                    'Cara',
                    style: TextStyle(
                      color: Color(0xFF6A1B9A),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => tossCoin('Coroa'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    minimumSize: Size(150, 50),
                  ),
                  child: Text(
                    'Coroa',
                    style: TextStyle(
                      color: Color(0xFF6A1B9A),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            // Exibe o resultado e as escolhas
            Text(
              'Sua escolha: $playerChoice',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              'Resultado: $computerChoice',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              'Resultado do Jogo: $result',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 15),
            // Botão de Voltar
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Voltar para a Tela de Jogos
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                minimumSize: Size(160, 50),
              ),
              child: Text(
                'Voltar',
                style: TextStyle(
                  color: Color(0xFF6A1B9A),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MemoryGameScreen extends StatefulWidget {
  @override
  _MemoryGameScreenState createState() => _MemoryGameScreenState();
}

class _MemoryGameScreenState extends State<MemoryGameScreen> {
  final List<String> cardSymbols = ['A', 'B', 'C', 'D', 'A', 'B', 'C', 'D'];
  List<String> shuffledSymbols = [];
  List<bool> cardFlipped = [];
  String? firstChoice;
  int firstIndex = -1;
  bool gameCompleted = false;

  @override
  void initState() {
    super.initState();
    shuffledSymbols = List.from(cardSymbols);
    shuffledSymbols.shuffle();
    cardFlipped = List.generate(cardSymbols.length, (_) => false);
  }

  void flipCard(int index) {
    setState(() {
      cardFlipped[index] = true;
      if (firstChoice == null) {
        firstChoice = shuffledSymbols[index];
        firstIndex = index;
      } else {
        if (firstChoice == shuffledSymbols[index]) {
          // Par de cartas iguais
          firstChoice = null;
          firstIndex = -1;
        } else {
          // Cartas diferentes
          Future.delayed(Duration(seconds: 1), () {
            setState(() {
              cardFlipped[firstIndex] = false;
              cardFlipped[index] = false;
              firstChoice = null;
              firstIndex = -1;
            });
          });
        }
      }
      if (!cardFlipped.contains(false)) {
        gameCompleted = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jogo de Memória')),
      body: Container(
        color: Color(0xFF6A1B9A), // Fundo roxo
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Imagem do jogo de memória
            Image.asset('assets/memoria.png', width: 150, height: 150),
            SizedBox(height: 20),
            // Mensagem de vitória
            gameCompleted
                ? Text(
                    'Parabéns! Você completou o jogo!',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  )
                : SizedBox(),
            // Grid de cartas
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
              ),
              itemCount: cardSymbols.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (!cardFlipped[index] && !gameCompleted) {
                      flipCard(index);
                    }
                  },
                  child: Card(
                    color: cardFlipped[index] ? Colors.green : Colors.blue,
                    child: Center(
                      child: cardFlipped[index]
                          ? Text(
                              shuffledSymbols[index],
                              style: TextStyle(fontSize: 24, color: Colors.white),
                            )
                          : null,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            // Botão para voltar
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Voltar para a Tela de Jogos
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
