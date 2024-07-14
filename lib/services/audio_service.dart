import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;

  AudioService._internal();

  final AudioPlayer _grAudio = AudioPlayer();
  final AudioPlayer _tapGameSound = AudioPlayer();
  final AudioPlayer _tapCardSound = AudioPlayer();
  final AudioPlayer _tapCardSoundSuccess = AudioPlayer();
  final AudioPlayer _levelSuccessSound = AudioPlayer();

  // Background sound
  void playBgm() {
    String path = "sounds/bgr_audio.mp3";
    _grAudio.play(AssetSource(path), volume: 50);
    _grAudio.setReleaseMode(ReleaseMode.loop);
  }

  void stopBgm() {
    _grAudio.stop();
  }

  // Stop all sounds
  Future<void> stopSound() async {
    await _tapGameSound.stop();
    await _tapCardSound.stop();
    await _tapCardSoundSuccess.stop();
    await _levelSuccessSound.stop();
  }

  // Play tap game sound
  Future<void> tapGameSound() async {
    String path = "sounds/tap_button_3.mp3";
    await stopSound();
    await _tapGameSound.play(AssetSource(path));
  }

  // Play tap card sound
  Future<void> tapCardSound() async {
    String path = "sounds/tap_card.mp3";
    await stopSound();
    await _tapCardSound.play(AssetSource(path));
  }

  // Play tap card success sound
  Future<void> tapCardSoundSuccess() async {
    String path = "sounds/tap_card_success.mp3";
    await stopSound();
    await _tapCardSoundSuccess.play(AssetSource(path));
  }

  // Play level success sound
  Future<void> levelSuccessSound() async {
    String path = "sounds/success_sound.mp3";
    await stopSound();
    await _levelSuccessSound.play(AssetSource(path));
  }

  // Dispose all audio players
  Future<void> dispose() async {
    await _grAudio.dispose();
    await _tapGameSound.dispose();
    await _tapCardSound.dispose();
    await _tapCardSoundSuccess.dispose();
    await _levelSuccessSound.dispose();
  }
}
