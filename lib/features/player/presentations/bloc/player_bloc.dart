import 'package:bloc/bloc.dart';
import 'package:capybara_game/common/navigator/navigator.dart';
import 'package:capybara_game/model/card_model.dart';
import 'package:capybara_game/model/level_model.dart';
import 'package:capybara_game/services/player_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:page_transition/page_transition.dart';

part 'player_event.dart';
part 'player_state.dart';
part 'player_bloc.freezed.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final AppNavigator appNavigator;
  PlayerBloc({required this.appNavigator}) : super((const PlayerState())) {
    on<PlayerInitEvent>(_onInit);
    on<PlayerTapCardEvent>(_onTapCard);
    on<PlayerOnTapNextEvent>(onTapNextLevel);
    on<PlayerOnTapRetryEvent>(onTapRetryGame);
  }
  void _onInit(PlayerInitEvent event, Emitter<PlayerState> emitter) {
    final dataCard = PlayerService().generateCardList(event.level);

    emitter(state.copyWith(dataCard: dataCard));
  }

  Future<void> _onTapCard(
      PlayerTapCardEvent event, Emitter<PlayerState> emitter) async {
    final card = event.card; // Lấy thông tin thẻ từ sự kiện

    if (state.isProcessing || card.isFlipped || card.isMatched) {
      return; // Kiểm tra nếu đang xử lý hoặc thẻ đã lật hoặc đã ghép thì không làm gì
    }

    card.isFlipped = true; // Lật thẻ hiện tại
    int newTries = state.tries + 1; // Tăng tries lên 1

    if (state.firstSelectedCard == null) {
      emitter(state.copyWith(
          firstSelectedCard:
              card)); // Nếu chưa có thẻ nào được chọn trước đó, cập nhật thẻ đầu tiên được chọn
    } else if (state.secondSelectedCard == null) {
      emitter(state.copyWith(
          secondSelectedCard: card,
          isProcessing: true,
          tries:
              newTries)); // Nếu có một thẻ đã được chọn, cập nhật thẻ thứ hai và đặt trạng thái đang xử lý

      if (state.firstSelectedCard!.identifier == card.identifier) {
        // Nếu hai thẻ có cùng định danh
        await Future.delayed(const Duration(milliseconds: 500)); // Chờ 500ms
        state.firstSelectedCard!.isMatched =
            true; // Đánh dấu thẻ đầu tiên đã ghép
        card.isMatched = true; // Đánh dấu thẻ thứ hai đã ghép
        emitter(state.copyWith(
            firstSelectedCard: null, // Đặt lại thẻ đầu tiên
            secondSelectedCard: null, // Đặt lại thẻ thứ hai
            isProcessing: false, // Đặt trạng thái không còn xử lý
            score: state.score + 20));

        // Kiểm tra nếu không còn thẻ nào chưa được ghép
        if (_allCardsMatched()) {
          emitter(state.copyWith(isSuccess: true));
        }
      } else {
        await Future.delayed(const Duration(
            milliseconds: 500)); // Chờ 500ms trước khi lật lại thẻ
        state.firstSelectedCard!.isFlipped = false; // Lật lại thẻ đầu tiên
        card.isFlipped = false; // Lật lại thẻ thứ hai
        emitter(state.copyWith(
          firstSelectedCard: null, // Đặt lại thẻ đầu tiên
          secondSelectedCard: null, // Đặt lại thẻ thứ hai
          isProcessing: false, // Đặt trạng thái không còn xử lý
        ));
      }
    }
  }

  void onTapNextLevel(
      PlayerOnTapNextEvent event, Emitter<PlayerState> emitter) {
    appNavigator.push(
      screen: ScreenType.player(event.levelModel.level + 1),
      pageTransitionType: PageTransitionType.fade,
    );
  }

  void onTapRetryGame(
      PlayerOnTapRetryEvent event, Emitter<PlayerState> emitter) {
    emitter(
        state.copyWith(isSuccess: false, score: 0, tries: 0, ratingStar: 0));
    appNavigator.pop();
    add(PlayerEvent.init(event.levelModel.level));
  }

  bool _allCardsMatched() {
    for (final card in state.dataCard) {
      if (!card.isMatched) {
        return false;
      }
    }
    return true;
  }
}
