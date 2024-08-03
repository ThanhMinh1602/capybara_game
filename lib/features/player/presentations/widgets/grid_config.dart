import 'package:capybara_game/model/card_model.dart';
import 'package:capybara_game/model/grid_config_model.dart';
import 'dart:math';

class GridConfig {
  List<String> generateCardPaths() {
    List<String> cardPaths = [];
    for (int i = 1; i <= 32; i++) {
      cardPaths.add('assets/images/cards/$i.png');
    }
    return cardPaths;
  }

  List<CardModel> generateCardList(int level) {
    List<String> identifiers = generateCardPaths();
    identifiers.shuffle(Random());

    List<CardModel> cards = [];
    final config = getGridConfigModel(level);

    for (int i = 0; i < config.numPairs; i++) {
      for (int j = 0; j < config.matchCount; j++) {
        cards.add(CardModel(identifier: identifiers[i % identifiers.length]));
      }
    }

    cards.shuffle(Random());
    return cards;
  }

  GridConfigModel getGridConfigModel(int level) {
    switch (level) {
      case 1:
        return GridConfigModel(
          gridSize: 1,
          numPairs: 1,
          matchCount: 2,
          tries3Star: 1,
          tries2Star: 0,
          tries1Star: 0,
        );
      case 2:
        return GridConfigModel(
          gridSize: 2,
          numPairs: 2,
          matchCount: 2,
          tries3Star: 5,
          tries2Star: 10,
          tries1Star: 15,
        );
      case 3:
        return GridConfigModel(
          gridSize: 2,
          numPairs: 3,
          matchCount: 2,
          tries3Star: 12,
          tries2Star: 22,
          tries1Star: 32,
        );
      case 4:
        return GridConfigModel(
          gridSize: 2,
          numPairs: 3,
          matchCount: 2,
          tries3Star: 10,
          tries2Star: 20,
          tries1Star: 30,
        );
      case 5:
        return GridConfigModel(
          gridSize: 3,
          numPairs: 6,
          matchCount: 2,
          tries3Star: 32,
          tries2Star: 42,
          tries1Star: 52,
        );
      case 6:
        return GridConfigModel(
          gridSize: 4,
          numPairs: 8,
          matchCount: 2,
          tries3Star: 48,
          tries2Star: 58,
          tries1Star: 68,
        );
      case 7:
        return GridConfigModel(
          gridSize: 4,
          numPairs: 10,
          matchCount: 2,
          tries3Star: 80,
          tries2Star: 90,
          tries1Star: 100,
        );
      case 8:
        return GridConfigModel(
          gridSize: 4,
          numPairs: 10,
          matchCount: 2,
          tries3Star: 75,
          tries2Star: 86,
          tries1Star: 95,
        );
      case 9:
        return GridConfigModel(
          gridSize: 5,
          numPairs: 15,
          matchCount: 2,
          tries3Star: 80,
          tries2Star: 90,
          tries1Star: 100,
        );
      case 10:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 18,
          matchCount: 2,
          tries3Star: 80,
          tries2Star: 90,
          tries1Star: 100,
        );
      default:
        return GridConfigModel(
          gridSize: 2,
          numPairs: 3,
          matchCount: 2,
          tries3Star: 3,
          tries2Star: 5,
          tries1Star: 6,
        );
    }
  }
}
