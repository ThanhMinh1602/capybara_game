import 'package:capybara_game/model/card_model.dart';
import 'package:capybara_game/model/grid_config_model.dart';

class GridConfig {
  // Hàm này sinh ra danh sách đường dẫn của các thẻ bài từ 1 đến 32
  List<String> generateCardPaths() {
    List<String> cardPaths = [];
    for (int i = 1; i <= 32; i++) {
      cardPaths.add('assets/images/cards/$i.png');
    }
    return cardPaths;
  }

  // Hàm này sinh ra danh sách các thẻ bài dựa trên cấp độ (level) truyền vào
  List<CardModel> generateCardList(int level) {
    List<String> identifiers = generateCardPaths();
    List<CardModel> cards = [];
    final config = getGridConfigModel(level);

    // Sinh ra số lượng cặp thẻ bài dựa trên config.numPairs và config.matchCount
    for (int i = 0; i < config.numPairs; i++) {
      for (int j = 0; j < config.matchCount; j++) {
        cards.add(CardModel(identifier: identifiers[i % identifiers.length]));
      }
    }

    // Đảm bảo số lượng thẻ bài bằng config.gridSize * config.gridSize
    while (cards.length < config.gridSize * config.gridSize) {
      cards.add(CardModel(
          identifier: identifiers[cards.length % identifiers.length]));
    }

    // Xáo trộn thứ tự của các thẻ bài
    cards.shuffle();
    return cards;
  }

  // Hàm tính số sao dựa trên điểm số (score) so với điểm số tối đa (maxScore)
  int calculateStars(double currentScore, double maxScore) {
    double percent = currentScore / maxScore;

    if (percent >= 1.0) {
      return 3; // 3 sao khi score đạt maxScore hoặc cao hơn
    } else if (percent >= 0.75) {
      return 2; // 2 sao khi score đạt 75% maxScore trở lên
    } else if (percent >= 0.5) {
      return 1; // 1 sao khi score đạt 50% maxScore trở lên
    } else {
      return 0; // Không hoàn thành nếu dưới 50% maxScore
    }
  }

  // Hàm này trả về thông tin cấu hình lưới (GridConfigModel) dựa trên cấp độ (level)
  GridConfigModel getGridConfigModel(int level) {
    const double score = 20;
    switch (level) {
      case 1:
        return GridConfigModel(
          gridSize: 1,
          numPairs: 1,
          maxScore: 1 * score,
          matchCount: 2,
          tries: 1 * 2,
        );
      case 2:
        return GridConfigModel(
          gridSize: 2,
          numPairs: 2,
          maxScore: 2 * score,
          matchCount: 2,
          tries: 2 * 2,
        );
      case 3:
        return GridConfigModel(
          gridSize: 2,
          numPairs: 3,
          maxScore: 3 * score,
          matchCount: 2,
          tries: 3 * 2,
        );
      case 4:
        return GridConfigModel(
          gridSize: 2,
          numPairs: 3,
          maxScore: 3 * score,
          matchCount: 2,
          tries: 3 * 2,
        );
      case 5:
        return GridConfigModel(
          gridSize: 3,
          numPairs: 6,
          maxScore: 6 * score,
          matchCount: 2,
          tries: 6 * 2,
        );
      case 6:
        return GridConfigModel(
          gridSize: 4,
          numPairs: 8,
          maxScore: 8 * score,
          matchCount: 2,
          tries: 8 * 2,
        );
      case 7:
        return GridConfigModel(
          gridSize: 4,
          numPairs: 10,
          maxScore: 10 * score,
          matchCount: 2,
          tries: 10 * 2,
        );
      case 8:
        return GridConfigModel(
          gridSize: 4,
          numPairs: 10,
          maxScore: 10 * score,
          matchCount: 2,
          tries: 10 * 2,
        );
      case 9:
        return GridConfigModel(
          gridSize: 5,
          numPairs: 15,
          maxScore: 15 * score,
          matchCount: 2,
          tries: 15 * 2,
        );
      case 10:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 18,
          maxScore: 18 * score,
          matchCount: 2,
          tries: 18 * 2 + 55,
        );
      case 11:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 18,
          maxScore: 18 * score,
          matchCount: 2,
          tries: 18 * 2 + 50,
        );
      case 12:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 18,
          maxScore: 18 * score,
          matchCount: 2,
          tries: 18 * 2 + 45,
        );
      case 13:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 18,
          maxScore: 18 * score,
          matchCount: 2,
          tries: 18 * 2 + 40,
        );
      case 14:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 18,
          maxScore: 18 * score,
          matchCount: 2,
          tries: 18 * 2 + 35,
        );
      case 15:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 18,
          maxScore: 18 * score,
          matchCount: 2,
          tries: 18 * 2 + 30,
        );
      case 16:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 18,
          maxScore: 18 * score,
          matchCount: 2,
          tries: 18 * 2 + 25,
        );
      case 17:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 18,
          maxScore: 18 * score,
          matchCount: 2,
          tries: 18 * 2 + 20,
        );
      case 18:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 18,
          maxScore: 18 * score,
          matchCount: 2,
          tries: 18 * 2 + 15,
        );
      case 19:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 18,
          maxScore: 18 * score,
          matchCount: 2,
          tries: 18 * 2 + 10,
        );
      case 20:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 18,
          maxScore: 18 * score,
          matchCount: 2,
          tries: 18 * 2 + 5,
        );
      case 21:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 21,
          maxScore: 21 * score,
          matchCount: 2,
          tries: 21 * 2 + 50,
        );
      case 22:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 21,
          maxScore: 21 * score,
          matchCount: 2,
          tries: 21 * 2 + 45,
        );
      case 23:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 21,
          maxScore: 21 * score,
          matchCount: 2,
          tries: 21 * 2 + 40,
        );
      case 24:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 21,
          maxScore: 21 * score,
          matchCount: 2,
          tries: 21 * 2 + 35,
        );
      case 25:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 21,
          maxScore: 21 * score,
          matchCount: 2,
          tries: 21 * 2 + 30,
        );
      case 26:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 21,
          maxScore: 21 * score,
          matchCount: 2,
          tries: 21 * 2 + 25,
        );
      case 27:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 21,
          maxScore: 21 * score,
          matchCount: 2,
          tries: 21 * 2 + 20,
        );
      case 28:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 21,
          maxScore: 21 * score,
          matchCount: 2,
          tries: 21 * 2 + 15,
        );
      case 29:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 21,
          maxScore: 21 * score,
          matchCount: 2,
          tries: 21 * 2 + 10,
        );
      case 30:
        return GridConfigModel(
          gridSize: 6,
          numPairs: 24,
          maxScore: 24 * score,
          matchCount: 2,
          tries: 24 * 2 + 5,
        );
      default:
        return GridConfigModel(
          gridSize: 2,
          numPairs: 3,
          maxScore: 15 * 10,
          matchCount: 2,
          tries: 3 * 2,
        );
    }
  }
}
