part of 'map_bloc.dart';

@freezed
class MapEvent with _$MapEvent {
  const factory MapEvent.init() = InitMapEvent;
  const factory MapEvent.chooseLevel(int levelNumber) = ChooseLevelEvent;
}
