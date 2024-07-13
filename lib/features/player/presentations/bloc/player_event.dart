part of 'player_bloc.dart';

@freezed
class PlayerEvent with _$PlayerEvent {
  const factory PlayerEvent.init(int level) = PlayerInitEvent;
  const factory PlayerEvent.tapCard(CardModel card, int tries, int score) =
      PlayerTapCardEvent;
  const factory PlayerEvent.onTapMenu() = PlayerOnTapMenuEvent;
  const factory PlayerEvent.onTapRetry(LevelModel levelModel) =
      PlayerOnTapRetryEvent;
  const factory PlayerEvent.onTapNext(LevelModel levelModel) =
      PlayerOnTapNextEvent;
}
