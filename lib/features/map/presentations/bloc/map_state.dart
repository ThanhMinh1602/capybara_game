part of 'map_bloc.dart';

@freezed
class MapState with _$MapState {
  const factory MapState({
    int? levelNumber,
    @Default([]) List<PlayerModel> dataLevels,
    @Default([]) List<PlayerModel> dataLevelUnlock,
  }) = _MapState;
}
