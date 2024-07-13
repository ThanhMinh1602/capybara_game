part of 'player_bloc.dart';

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState(
      {@Default([]) List<CardModel> dataCard,
      CardModel? firstSelectedCard,
      CardModel? secondSelectedCard,
      @Default(false) bool isProcessing,
      @Default(0) int tries,
      @Default(0) int score,
      @Default(0) int ratingStar,
      @Default(false) bool isSuccess,
      @Default({}) Map<String, dynamic> config}) = _PlayerState;
}
