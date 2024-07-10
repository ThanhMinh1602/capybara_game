// import 'package:audioplayers/audioplayers.dart';

// class AudioManager {
//   static final AudioManager _instance = AudioManager._internal();
//   factory AudioManager() => _instance;

//   AudioManager._internal();

//   final AudioCache _audioCache = AudioCache(prefix: 'assets/sounds/');
//   final AudioPlayer _bgmPlayer = AudioPlayer();

//   Future<void> init() async {
//     // Load sound files
//     await _audioCache.loadAll([
//       'bgm.mp3',
//       'button_click.mp3',
//       // Add more sounds here
//     ]);
//   }

//   void playBgm() {
//     _bgmPlayer.setReleaseMode(ReleaseMode.LOOP);
//     _audioCache.play('bgm.mp3');
//   }

//   void playButtonClick() {
//     _audioCache.play('button_click.mp3');
//   }

//   void stopBgm() {
//     _bgmPlayer.stop();
//   }

//   void dispose() {
//     _bgmPlayer.dispose();
//   }
// }
