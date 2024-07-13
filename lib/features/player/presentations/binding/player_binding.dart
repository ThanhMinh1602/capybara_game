import 'package:capybara_game/common/extensions/build_context_extension.dart';
import 'package:capybara_game/features/player/presentations/bloc/player_bloc.dart';
import 'package:capybara_game/services/level_service.dart';
import 'package:capybara_game/services/player_service.dart';
import 'package:flutter/material.dart';

class PlayerBinding {
  static PlayerBloc generateBloc(BuildContext context) {
    return PlayerBloc(
      appNavigator: context.getNavigator(),
      levelService: LevelService(),
      playerService: PlayerService(),
    );
  }
}
