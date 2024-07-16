import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VolumeControlScreen(),
    );
  }
}

class VolumeControlScreen extends StatefulWidget {
  @override
  _VolumeControlScreenState createState() => _VolumeControlScreenState();
}

class _VolumeControlScreenState extends State<VolumeControlScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  double _currentVolume = 0.5;

  @override
  void initState() {
    super.initState();
    audioPlayer.setVolume(_currentVolume);
    audioPlayer.play(UrlSource(
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'));
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volume Control'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Volume: ${(_currentVolume * 100).round()}%'),
          Slider(
            value: _currentVolume,
            min: 0.0,
            max: 1.0,
            onChanged: (value) {
              setState(() {
                _currentVolume = value;
                audioPlayer.setVolume(_currentVolume);
              });
            },
          ),
        ],
      ),
    );
  }
}
