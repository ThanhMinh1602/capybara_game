import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;

  AudioManager._internal();

  final AudioPlayer _player = AudioPlayer();
  void playBgm() {
    String path = "sounds/bgr_audio.mp3";
    _player.play(AssetSource(path));
    _player.setReleaseMode(ReleaseMode.loop);
  }

  void stopBgm() {
    _player.stop();
  }

  void dispose() {
    _player.dispose();
  }
}
