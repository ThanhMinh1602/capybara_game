import 'package:capybara_game/features/app/presentations/bloc/app_bloc.dart';
import 'package:capybara_game/services/audio_service.dart';
import 'package:flutter/widgets.dart';

class AppBinding {
  static AppBloc generateBloc(BuildContext context) {
    return AppBloc(
      audioService: AudioService(),
    );
  }
}
