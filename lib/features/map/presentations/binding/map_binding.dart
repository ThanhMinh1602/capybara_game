import 'package:capybara_game/common/extensions/build_context_extension.dart';
import 'package:capybara_game/features/map/presentations/bloc/map_bloc.dart';
import 'package:capybara_game/services/level_service.dart';
import 'package:flutter/widgets.dart';

class MapBinding {
  static MapBloc generateBloc(BuildContext context) {
    return MapBloc(
      appNavigator: context.getNavigator(),
      levelService: LevelService(),
    );
  }
}
