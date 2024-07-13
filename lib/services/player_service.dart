import 'package:capybara_game/model/card_model.dart';

class PlayerService {
  List<String> generateCardPaths() {
    List<String> cardPaths = [];
    for (int i = 1; i <= 32; i++) {
      cardPaths.add('assets/images/cards/$i.png');
    }
    return cardPaths;
  }

  List<CardModel> generateCardList(int level) {
    List<String> identifiers = generateCardPaths();
    List<CardModel> cards = [];
    final config = getGridConfig(level);

    for (int i = 0; i < config['numPairs']!.toInt(); i++) {
      for (int j = 0; j < config['matchCount']!.toInt(); j++) {
        cards.add(CardModel(identifier: identifiers[i % identifiers.length]));
      }
    }

    // Ensure the total number of cards matches the grid size
    while (cards.length < config['gridSize']! * config['gridSize']!) {
      cards.add(CardModel(
          identifier: identifiers[cards.length % identifiers.length]));
    }

    cards.shuffle();
    return cards;
  }

  Map<String, int> getGridConfig(int level) {
    if (level == 1) {
      return {
        'gridSize': 1,
        'numPairs': 1 * 2 ~/ 2,
        'matchCount': 2,
      };
    } else if (level == 2) {
      return {
        'gridSize': 2,
        'numPairs': 2 * 2 ~/ 2,
        'matchCount': 2,
      };
    } else if (level == 3) {
      return {
        'gridSize': 2,
        'numPairs': 2 * 3 ~/ 2,
        'matchCount': 2,
      };
    } else if (level == 4) {
      return {
        'gridSize': 3,
        'numPairs': 3 * 3 ~/ 2,
        'matchCount': 2,
      };
    } else if (level == 5) {
      return {
        'gridSize': 3,
        'numPairs': 3 * 4 ~/ 2,
        'matchCount': 2,
      };
    } else if (level == 6) {
      return {
        'gridSize': 4,
        'numPairs': 4 * 4 ~/ 2,
        'matchCount': 2,
      };
    } else if (level == 7) {
      return {
        'gridSize': 4,
        'numPairs': 4 * 5 ~/ 2,
        'matchCount': 2,
      };
    } else if (level == 8) {
      return {
        'gridSize': 5,
        'numPairs': 5 * 5 ~/ 2,
        'matchCount': 2,
      };
    } else if (level == 9) {
      return {
        'gridSize': 5,
        'numPairs': 5 * 6 ~/ 2,
        'matchCount': 2,
      };
    } else if (level == 10) {
      return {
        'gridSize': 6,
        'numPairs': 6 * 6 ~/ 2,
        'matchCount': 2,
      };
    } else if (level <= 15) {
      return {
        'gridSize': 7,
        'numPairs': (7 * 7) ~/ 3,
        'matchCount': 3,
      };
    } else if (level <= 20) {
      return {
        'gridSize': 7,
        'numPairs': (7 * 7) ~/ 4,
        'matchCount': 4,
      };
    } else if (level <= 30) {
      return {
        'gridSize': 8,
        'numPairs': (8 * 8) ~/ 3,
        'matchCount': 3,
      };
    } else {
      return {
        'gridSize': 8,
        'numPairs': (8 * 8) ~/ 4,
        'matchCount': 4,
      };
    }
  }
}
