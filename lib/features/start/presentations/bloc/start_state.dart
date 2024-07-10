part of 'start_bloc.dart';

@freezed
class StartState with _$StartState {
  const factory StartState({
    @Default(false) bool isLoading,
  }) = _StartState;
}
