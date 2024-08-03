import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:bloc/bloc.dart';
import 'package:capybara_game/services/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_event.dart'; // Khai báo phần của tệp chứa các sự kiện
part 'app_state.dart'; // Khai báo phần của tệp chứa trạng thái
part 'app_bloc.freezed.dart'; // Khai báo phần của tệp chứa mã được tạo bởi freezed

class AppBloc extends Bloc<AppEvent, AppState> {
  final AudioService audioService;
  AppBloc({required this.audioService}) : super(const AppState()) {
    // Đăng ký các phương thức xử lý sự kiện
    on(onChooseOption);
    on(onChangeMusicState);
    on(onChangeSoundState);
    on(onChangeBgmVolume);
    on(onChangeEffectsVolume);
  }
}

// Mở rộng thêm các phương thức xử lý sự kiện cho AppBloc
extension AppBlocExtension on AppBloc {

  // Xử lý sự kiện thay đổi tùy chọn
  void onChooseOption(
      ChooseOptionSettingEvent event, Emitter<AppState> emitter) {
    emitter(state.copyWith(option: event.option));
  }

  void onChangeMusicState(StateMusicEvent event, Emitter<AppState> emitter) {
    bool musicState = event.isPlayMusic;
    if (musicState) {
      audioService.setBgmVolume(0);
    } else {
      audioService.setBgmVolume(state.bgmVolume);
    }
    emitter(state.copyWith(isPlayMusic: !musicState));
  }

  void onChangeSoundState(StateSoundEvent event, Emitter<AppState> emitter) {
    bool soundState = event.isPlaySound;
    if (soundState) {
      audioService.setEffectsVolume(0);
    } else {
      audioService.setEffectsVolume(state.effectsVolume);
    }
    emitter(state.copyWith(isPlaySound: !soundState));
  }

  void onChangeBgmVolume(
      ChangeBgmVolumeEvent event, Emitter<AppState> emitter) {
    audioService.setBgmVolume(event.volume);
    emitter(state.copyWith(bgmVolume: event.volume));
  }

  void onChangeEffectsVolume(
      ChangeEffectsVolumeEvent event, Emitter<AppState> emitter) {
    audioService.setEffectsVolume(event.volume);
    emitter(state.copyWith(effectsVolume: event.volume));
  }
}
