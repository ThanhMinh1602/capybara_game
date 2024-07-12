import 'package:bloc/bloc.dart';
import 'package:capybara_game/common/navigator/navigator.dart';
import 'package:capybara_game/model/card_model.dart';
import 'package:capybara_game/services/player_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_event.dart';
part 'player_state.dart';
part 'player_bloc.freezed.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final AppNavigator appNavigator;
  PlayerBloc({required this.appNavigator}) : super((const PlayerState())) {
    on<PlayerInitEvent>(_onInit);
    on<PlayerTapCardEvent>(_onTapCard);
  }

  void _onInit(PlayerInitEvent event, Emitter<PlayerState> emitter) {
    final dataCard = PlayerService().generateCardList();
    emitter(state.copyWith(dataCard: dataCard));
  }

  Future<void> _onTapCard(
      PlayerTapCardEvent event, Emitter<PlayerState> emitter) async {
    final card = event.card;
    if (state.isProcessing || card.isFlipped || card.isMatched) return;
    card.isFlipped = true;
    if (state.firstSelectedCard == null) {
      emitter(state.copyWith(firstSelectedCard: card));
    } else if (state.secondSelectedCard == null) {
      emitter(state.copyWith(secondSelectedCard: card, isProcessing: true));

      if (state.firstSelectedCard!.identifier ==
          state.secondSelectedCard!.identifier) {
        state.firstSelectedCard!.isMatched = true;
        state.secondSelectedCard!.isMatched = true;
        emitter(state.copyWith(
          firstSelectedCard: null,
          secondSelectedCard: null,
          isProcessing: false,
        ));
      } else {
        await Future.delayed(const Duration(milliseconds: 500));
        state.firstSelectedCard!.isFlipped = false;
        state.secondSelectedCard!.isFlipped = false;
        emitter(state.copyWith(
          firstSelectedCard: null,
          secondSelectedCard: null,
          isProcessing: false,
        ));
      }
    }
  }
}
