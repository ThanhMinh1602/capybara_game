part of 'player_bloc.dart';

@freezed
class PlayerEvent with _$PlayerEvent {
  const factory PlayerEvent.init(int level) = PlayerInitEvent;
  const factory PlayerEvent.tapCard(CardModel card) = PlayerTapCardEvent;
}
