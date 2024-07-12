part of 'player_bloc.dart';

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState({
    @Default([]) List<CardModel> dataCard,
    CardModel? firstSelectedCard,
    CardModel? secondSelectedCard,
    @Default(false) bool isProcessing,
  }) = _PlayerState;
}
