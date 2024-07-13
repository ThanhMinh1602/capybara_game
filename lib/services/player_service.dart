import 'package:capybara_game/model/card_model.dart';
import 'package:capybara_game/model/grid_config_model.dart';

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
    final config = getGridConfigModel(level);

    for (int i = 0; i < config.numPairs; i++) {
      for (int j = 0; j < config.matchCount; j++) {
        cards.add(CardModel(identifier: identifiers[i % identifiers.length]));
      }
    }

    while (cards.length < config.gridSize * config.gridSize) {
      cards.add(CardModel(
          identifier: identifiers[cards.length % identifiers.length]));
    }

    cards.shuffle();
    return cards;
  }

  GridConfigModel getGridConfigModel(int level) {
    switch (level) {
      case 1:
        return GridConfigModel(
          gridSize: 1,
          numPairs: 1,
          matchCount: 2,
          tries3Star: 2,
          tries2Star: 3,
          tries1Star: 4,
        );
      case 2:
        return GridConfigModel(
          gridSize: 2,
          numPairs: 2,
          matchCount: 2,
          tries3Star: 8,
          tries2Star: 10,
          tries1Star: 12,
        );
      case 3:
        return GridConfigModel(
          gridSize: 2,
          numPairs: 3,
          matchCount: 2,
          tries3Star: 3,
          tries2Star: 5,
          tries1Star: 6,
        );
      case 4:
        return GridConfigModel(
          gridSize: 2,
          numPairs: 3,
          matchCount: 2,
          tries3Star: 4,
          tries2Star: 6,
          tries1Star: 7,
        );
      case 5:
        return GridConfigModel(
          gridSize: 3,
          numPairs: 6,
          matchCount: 2,
          tries3Star: 5,
          tries2Star: 7,
          tries1Star: 8,
        );
      case 6:
        return GridConfigModel(
          gridSize: 4,
          numPairs: 8,
          matchCount: 2,
          tries3Star: 6,
          tries2Star: 8,
          tries1Star: 9,
        );
      case 7:
        return GridConfigModel(
          gridSize: 4,
          numPairs: 10,
          matchCount: 2,
          tries3Star: 7,
          tries2Star: 9,
          tries1Star: 10,
        );
      case 8:
        return GridConfigModel(
          gridSize: 4,
          numPairs: 10,
          matchCount: 2,
          tries3Star: 8,
          tries2Star: 10,
          tries1Star: 11,
        );
      case 9:
        return GridConfigModel(
          gridSize: 5,
          numPairs: 15,
          matchCount: 2,
          tries3Star: 9,
          tries2Star: 11,
          tries1Star: 12,
        );
      case 10:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 18,
          matchCount: 2,
          tries3Star: 10,
          tries2Star: 12,
          tries1Star: 13,
        );
      // case 11:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 18,
      //     matchCount: 2,
      //     tries3Star: 11,
      //     tries2Star: 13,
      //     tries1Star: 14,
      //   );
      // case 12:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 18,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 13:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 18,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 14:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 18,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 15:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 18,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 16:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 18,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 17:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 18,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 18:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 18,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 19:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 18,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 20:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 18,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 21:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 22:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 23:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 24:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 25:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 26:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 27:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 28:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 29:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 30:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 31:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 32:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 33:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 34:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 35:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 36:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 37:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 38:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 39:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 40:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 24,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 41:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 30,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 42:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 30,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 43:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 30,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 44:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 30,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 45:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 30,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 46:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 30,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 47:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 30,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 48:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 30,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 49:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 30,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
      // case 50:
      //   return GridConfigModel(
      //     gridSize: 6,
      //     numPairs: 30,
      //     matchCount: 2,
      //     tries3Star: 12,
      //     tries2Star: 14,
      //     tries1Star: 15,
      //   );
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
