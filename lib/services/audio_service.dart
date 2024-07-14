import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;

  AudioManager._internal();

  final AudioPlayer _grAudio = AudioPlayer();
  final AudioPlayer _tapGameSound = AudioPlayer();
  final AudioPlayer _tapCardSound = AudioPlayer();
  final AudioPlayer _tapCardSoundSuccess = AudioPlayer();
  final AudioPlayer _levelSuccessSound = AudioPlayer();

  //bgrsound
  void playBgm() {
    String path = "sounds/bgr_audio.mp3";
    _grAudio.play(AssetSource(path));
    _grAudio.setReleaseMode(ReleaseMode.loop);
  }

  void stopBgm() {
    _grAudio.stop();
  }

//tapGameSound
  void tapGameSound() {
    String path = "sounds/tap_button_2.mp3";
    _tapGameSound.play(AssetSource(path));
  }

//tap Card Sound
  void tapCardSound() {
    String path = "sounds/tap_card.mp3";
    _tapCardSound.play(AssetSource(path));
  }

  void tapCardSoundSuccess() {
    String path = "sounds/tap_card_success.mp3";
    _tapCardSoundSuccess.play(AssetSource(path));
  }

  void levelSuccessSound() {
    String path = "sounds/success_sound.mp3";
    _levelSuccessSound.play(AssetSource(path));
  }

  void dispose() {
    _grAudio.dispose();
  }
}
