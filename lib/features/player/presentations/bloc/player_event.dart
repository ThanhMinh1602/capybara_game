part of 'player_bloc.dart';

@freezed
class PlayerEvent with _$PlayerEvent {
  const factory PlayerEvent.init(int level) = PlayerInitEvent;
  const factory PlayerEvent.tapCard(
          CardModel card, int tries, int level, double maxScore) =
      PlayerTapCardEvent;
  const factory PlayerEvent.onTapMenu() = PlayerOnTapMenuEvent;
  const factory PlayerEvent.onTapRetry(PlayerModel levelModel) =
      PlayerOnTapRetryEvent;
  const factory PlayerEvent.onTapNext(PlayerModel levelModel) =
      PlayerOnTapNextEvent;
}
