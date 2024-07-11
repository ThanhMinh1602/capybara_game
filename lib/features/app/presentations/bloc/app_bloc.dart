import 'package:bloc/bloc.dart';
import 'package:capybara_game/services/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on(onChooseOption);
    on(onSetMusicState);
    on(onSetSoundState);
  }
}

extension AppBlocExtension on AppBloc {
  void onChooseOption(
      ChooseOptionSettingEvent event, Emitter<AppState> emitter) {
    emitter(state.copyWith(option: event.option));
  }

  void onSetMusicState(StateMusicEvent event, Emitter<AppState> emitter) {
    bool musicState = event.isPlayMusic;
    if (musicState == true) {
      AudioManager().stopBgm();
    } else {
      AudioManager().playBgm();
    }
    emitter(state.copyWith(music: !musicState));
  }

  void onSetSoundState(StateSoundEvent event, Emitter<AppState> emitter) {
    bool soundState = event.isPlaySound;
    emitter(state.copyWith(sound: !soundState));
  }
}
