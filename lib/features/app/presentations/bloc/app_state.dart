part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(0) int option,
    @Default(true) bool isPlayMusic,
    @Default(true) bool isPlaySound,
    @Default(0.5) double bgmVolume,
    @Default(0.5) double effectsVolume,
  }) = _AppState;
}
