part of 'player_bloc.dart';

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState(
      {@Default([]) List<CardModel> dataCard,
      CardModel? firstSelectedCard,
      CardModel? secondSelectedCard,
      @Default(false) bool isProcessing,
      @Default(0) int tries,
      @Default(0) int oldTries,
      @Default(3) int ratingStar,
      @Default(false) bool isSuccess,
      @Default({}) Map<String, dynamic> config}) = _PlayerState;
}
