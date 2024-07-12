import 'package:capybara_game/model/card_model.dart';

class PlayerService {
  List<String> generateCardPaths() {
    List<String> cardPaths = [];
    for (int i = 1; i <= 32; i++) {
      cardPaths.add('assets/images/cards/$i.png');
    }
    return cardPaths;
  }

  List<CardModel> generateCardList() {
    List<String> identifiers = generateCardPaths();
    List<CardModel> cards = [];
    for (String id in identifiers) {
      cards.add(CardModel(identifier: id));
      cards.add(CardModel(identifier: id));
    }

    cards.shuffle();
    return cards;
  }
}
