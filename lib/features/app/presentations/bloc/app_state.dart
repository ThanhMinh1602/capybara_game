part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(0) int option,
    @Default(true) bool music,
    @Default(true) bool sound,
  }) = _AppState;
}
