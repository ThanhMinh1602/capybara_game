part of 'start_bloc.dart';

@freezed
class StartEvent with _$StartEvent {
  const factory StartEvent.started() = StartInitEvent;
}
