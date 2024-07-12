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
    // Nếu cấp độ từ 1 đến 9
    if (level <= 9) {
      int size = level + 1; // Kích thước lưới là cấp độ + 1
      return {
        'gridSize': size, // Kích thước lưới (ví dụ: 2x2, 3x3, ...)
        'numPairs': (size * size) ~/
            2, // Số lượng cặp thẻ là một nửa tổng số ô trong lưới
        'matchCount': 2 // Mỗi cặp thẻ gồm 2 thẻ
      };
    }
    // Nếu cấp độ từ 10 đến 15
    else if (level <= 15) {
      return {
        'gridSize': 7, // Kích thước lưới cố định là 7x7
        'numPairs': (7 * 7) ~/
            3, // Số lượng cặp thẻ là một phần ba tổng số ô trong lưới
        'matchCount': 3 // Mỗi cặp thẻ gồm 3 thẻ
      };
    }
    // Nếu cấp độ từ 16 đến 20
    else if (level <= 20) {
      return {
        'gridSize': 7, // Kích thước lưới cố định là 7x7
        'numPairs': (7 * 7) ~/
            4, // Số lượng cặp thẻ là một phần tư tổng số ô trong lưới
        'matchCount': 4 // Mỗi cặp thẻ gồm 4 thẻ
      };
    }
    // Nếu cấp độ từ 21 đến 30
    else if (level <= 30) {
      return {
        'gridSize': 8, // Kích thước lưới cố định là 8x8
        'numPairs': (8 * 8) ~/
            3, // Số lượng cặp thẻ là một phần ba tổng số ô trong lưới
        'matchCount': 3 // Mỗi cặp thẻ gồm 3 thẻ
      };
    }
    // Nếu cấp độ từ 31 trở lên
    else {
      return {
        'gridSize': 8, // Kích thước lưới cố định là 8x8
        'numPairs': (8 * 8) ~/
            4, // Số lượng cặp thẻ là một phần tư tổng số ô trong lưới
        'matchCount': 4 // Mỗi cặp thẻ gồm 4 thẻ
      };
    }
  }
}
