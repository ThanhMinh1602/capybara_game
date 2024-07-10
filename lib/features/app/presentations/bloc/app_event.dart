part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.initialize() = AppInitializeEvent;
  const factory AppEvent.chooseOptionSetting(int option) =
      ChooseOptionSettingEvent;
}
