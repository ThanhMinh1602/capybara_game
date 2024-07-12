import 'package:flutter/material.dart';

class CardModel {
  final String identifier;
  bool isFlipped;
  bool isMatched;

  CardModel({
    required this.identifier,
    this.isFlipped = false,
    this.isMatched = false,
  });
}

List<CardModel> generateCardList() {
  List<String> identifiers = ['A', 'B', 'C', 'D', 'E', 'F'];
  List<CardModel> cards = [];

  for (String id in identifiers) {
    cards.add(CardModel(identifier: id));
    cards.add(CardModel(identifier: id));
  }

  cards.shuffle();
  return cards;
}

class CardFlippingGame extends StatefulWidget {
  @override
  _CardFlippingGameState createState() => _CardFlippingGameState();
}

class _CardFlippingGameState extends State<CardFlippingGame> {
  List<CardModel> cards = generateCardList();
  CardModel? firstSelectedCard;
  CardModel? secondSelectedCard;
  bool isProcessing = false;

  void onCardTap(CardModel card) {
    if (isProcessing || card.isFlipped || card.isMatched) return;

    setState(() {
      card.isFlipped = true;

      if (firstSelectedCard == null) {
        firstSelectedCard = card;
      } else if (secondSelectedCard == null) {
        secondSelectedCard = card;
        isProcessing = true;

        if (firstSelectedCard!.identifier == secondSelectedCard!.identifier) {
          firstSelectedCard!.isMatched = true;
          secondSelectedCard!.isMatched = true;
          resetSelectedCards();
        } else {
          Future.delayed(Duration(milliseconds: 500), () {
            setState(() {
              firstSelectedCard!.isFlipped = false;
              secondSelectedCard!.isFlipped = false;
              resetSelectedCards();
            });
          });
        }
      }
    });
  }

  void resetSelectedCards() {
    firstSelectedCard = null;
    secondSelectedCard = null;
    isProcessing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Flipping Game'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          CardModel card = cards[index];
          return GestureDetector(
            onTap: () => onCardTap(card),
            child: Card(
              child: Center(
                child: Text(
                  card.isFlipped ? card.identifier : '',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              color: card.isMatched ? Colors.transparent : Colors.blue,
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CardFlippingGame(),
  ));
}
