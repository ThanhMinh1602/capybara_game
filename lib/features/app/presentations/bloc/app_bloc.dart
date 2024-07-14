import 'package:bloc/bloc.dart';
import 'package:capybara_game/services/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_event.dart'; // Khai báo phần của tệp chứa các sự kiện
part 'app_state.dart'; // Khai báo phần của tệp chứa trạng thái
part 'app_bloc.freezed.dart'; // Khai báo phần của tệp chứa mã được tạo bởi freezed

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    // Đăng ký các phương thức xử lý sự kiện
    on<ChooseOptionSettingEvent>(onChooseOption);
    on<StateMusicEvent>(onSetMusicState);
    on<StateSoundEvent>(onSetSoundState);
  }
}

// Mở rộng thêm các phương thức xử lý sự kiện cho AppBloc
extension AppBlocExtension on AppBloc {
  // Xử lý sự kiện thay đổi tùy chọn
  void onChooseOption(
      ChooseOptionSettingEvent event, Emitter<AppState> emitter) {
    emitter(state.copyWith(option: event.option));
  }

  // Xử lý sự kiện thay đổi trạng thái âm nhạc
  void onSetMusicState(StateMusicEvent event, Emitter<AppState> emitter) {
    bool musicState = event.isPlayMusic;
    if (musicState == true) {
      AudioManager().stopBgm(); // Dừng phát nhạc nền nếu đang phát
    } else {
      AudioManager().playBgm(); // Phát nhạc nền nếu không phát
    }
    emitter(state.copyWith(music: !musicState)); // Cập nhật trạng thái âm nhạc
  }

  // Xử lý sự kiện thay đổi trạng thái âm thanh
  void onSetSoundState(StateSoundEvent event, Emitter<AppState> emitter) {
    bool soundState = event.isPlaySound;
    emitter(state.copyWith(sound: !soundState)); // Cập nhật trạng thái âm thanh
  }
}
