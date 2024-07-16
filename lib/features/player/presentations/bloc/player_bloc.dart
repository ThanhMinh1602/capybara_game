import 'package:bloc/bloc.dart';
import 'package:capybara_game/common/navigator/navigator.dart';
import 'package:capybara_game/model/card_model.dart';
import 'package:capybara_game/model/level_model.dart';
import 'package:capybara_game/model/player_model.dart';
import 'package:capybara_game/services/audio_service.dart';
import 'package:capybara_game/services/level_service.dart';
import 'package:capybara_game/services/player_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:page_transition/page_transition.dart';

part 'player_event.dart';
part 'player_state.dart';
part 'player_bloc.freezed.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final AppNavigator appNavigator;
  final LevelService levelService;
  final PlayerService playerService;
  final AudioService audioService;

  PlayerBloc(
      {required this.levelService,
      required this.appNavigator,
      required this.playerService,
      required this.audioService})
      : super((const PlayerState())) {
    on(_onInit);
    on(_onTapCard);
    on(onTapNextLevel);
    on(onTapRetryGame);
    on(onTapMenu);
  }
}

extension PlayerBlocExtension on PlayerBloc {
  Future<void> _onInit(
      PlayerInitEvent event, Emitter<PlayerState> emitter) async {
    final dataCard = playerService.generateCardList(event.level);
    final dataLevel = await levelService.getDataLevelByLevel(event.level);
    if (dataLevel == null) {
      emitter(state.copyWith(dataCard: dataCard));
    } else {
      final oldTries = dataLevel.tries;
      emitter(state.copyWith(dataCard: dataCard, oldTries: oldTries));
    }
  }

  Future<void> _onTapCard(
      PlayerTapCardEvent event, Emitter<PlayerState> emitter) async {
    final card = event.card;

    // Kiểm tra nếu đang xử lý hoặc thẻ đã lật hoặc đã ghép thì không làm gì
    if (state.isProcessing || card.isFlipped || card.isMatched) return;

    // Phát âm thanh khi người chơi chạm vào thẻ
    audioService.tapCardSound();
    card.isFlipped = true; // Lật thẻ hiện tại
    int newTries = state.tries + 1; // Tăng tries lên 1
    int stars = _calculateStars(newTries, event.level); // Tính số sao
    emitter(state.copyWith(ratingStar: stars));

    if (state.firstSelectedCard == null) {
      emitter(state.copyWith(
          firstSelectedCard: card)); // Cập nhật thẻ đầu tiên được chọn
    } else if (state.secondSelectedCard == null) {
      emitter(state.copyWith(
          secondSelectedCard: card,
          isProcessing: true,
          tries:
              newTries)); // Cập nhật thẻ thứ hai và đặt trạng thái đang xử lý

      if (state.firstSelectedCard!.identifier == card.identifier) {
        await Future.delayed(const Duration(milliseconds: 500)); // Chờ 500ms
        state.firstSelectedCard!.isMatched =
            true; // Đánh dấu thẻ đầu tiên đã ghép
        card.isMatched = true; // Đánh dấu thẻ thứ hai đã ghép
        emitter(state.copyWith(
            firstSelectedCard: null,
            secondSelectedCard: null,
            isProcessing: false));

        // Phát âm thanh khi ghép thành công
        audioService.tapCardSoundSuccess();

        if (_allCardsMatched()) {
          emitter(state.copyWith(
              isSuccess:
                  true)); // Kiểm tra nếu không còn thẻ nào chưa được ghép

          // Phát âm thanh khi hoàn thành level
          audioService.levelSuccessSound();
          final playerModel = PlayerModel(
              level: event.level,
              tries: state.tries,
              ratingStar: state.ratingStar);
          final levelData = await levelService.getDataLevelByLevel(event.level);
          if (levelData == null) {
            await levelService.addLevel(playerModel);
          } else {
            final oldStar = levelData.ratingStar;
            final oldTries = levelData.tries;
            if (oldStar < playerModel.ratingStar ||
                oldTries > playerModel.tries) {
              await levelService.updateLevel(playerModel);
            }
          }
        }
      } else {
        await Future.delayed(const Duration(
            milliseconds: 500)); // Chờ 500ms trước khi lật lại thẻ
        state.firstSelectedCard!.isFlipped = false; // Lật lại thẻ đầu tiên
        card.isFlipped = false; // Lật lại thẻ thứ hai
        emitter(state.copyWith(
            firstSelectedCard: null,
            secondSelectedCard: null,
            isProcessing: false)); // Đặt lại trạng thái
      }
    }
  }

  Future<void> onTapNextLevel(
      PlayerOnTapNextEvent event, Emitter<PlayerState> emitter) async {
    audioService.tapCardSound();
    appNavigator.push(
      screen: ScreenType.player(event.levelModel.level + 1),
      pageTransitionType: PageTransitionType.fade,
    );
  }

  void onTapRetryGame(
      PlayerOnTapRetryEvent event, Emitter<PlayerState> emitter) {
    emitter(state.copyWith(
        isSuccess: false,
        oldTries: event.levelModel.tries,
        tries: 0,
        ratingStar: 0));
    appNavigator.pop();
    add(PlayerEvent.init(event.levelModel.level));
  }

  void onTapMenu(PlayerOnTapMenuEvent event, Emitter<PlayerState> emitter) {
    appNavigator.pushAndRemoveUntil(
        screen: const ScreenType.map(),
        transitionType: PageTransitionType.leftToRightWithFade);
  }

  bool _allCardsMatched() {
    for (final card in state.dataCard) {
      if (!card.isMatched) {
        return false;
      }
    }
    return true;
  }

  int _calculateStars(int tries, int levelData) {
    final level = levelData;
    final config = playerService.getGridConfigModel(level);

    if (tries <= config.tries3Star) {
      return 3;
    } else if (tries <= config.tries2Star) {
      return 2;
    } else if (tries <= config.tries1Star) {
      return 1;
    } else {
      return 0;
    }
  }
}
