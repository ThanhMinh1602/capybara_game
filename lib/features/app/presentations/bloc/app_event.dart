part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.initialize() = AppInitializeEvent;
  const factory AppEvent.chooseOptionSetting(int option) =
      ChooseOptionSettingEvent;
  const factory AppEvent.stateMusic(bool isPlayMusic) = StateMusicEvent;
  const factory AppEvent.stateSound(bool isPlaySound) = StateSoundEvent;
}
