part of 'map_bloc.dart';

@freezed
class MapEvent with _$MapEvent {
  const factory MapEvent.init() = InitEvent;
  const factory MapEvent.chooseLevel(int levelNumber) = ChooseLevelEvent;
}
