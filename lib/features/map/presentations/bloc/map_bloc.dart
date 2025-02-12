import 'package:bloc/bloc.dart';
import 'package:capybara_game/common/navigator/navigator.dart';
import 'package:capybara_game/model/player_model.dart';
import 'package:capybara_game/services/level_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_event.dart';
part 'map_state.dart';
part 'map_bloc.freezed.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final AppNavigator appNavigator;
  final LevelService levelService;
  MapBloc({required this.appNavigator, required this.levelService})
      : super(const MapState()) {
    on(onInit);
    on(onChooseLevel);
  }
}

extension MapBlocExtension on MapBloc {
  Future<void> onInit(MapEvent event, Emitter<MapState> emitter) async {
    List<PlayerModel> dataLevels = await levelService.getAllLevels();
    List<PlayerModel> listLevelUnlock = dataLevels
        .where(
          (element) => element.ratingStar != 0,
        )
        .toList();
    emitter(state.copyWith(
        dataLevels: dataLevels, dataLevelUnlock: listLevelUnlock));
  }

  void onChooseLevel(ChooseLevelEvent event, Emitter<MapState> emitter) {
    appNavigator.push(screen: ScreenType.player(event.levelNumber));
  }
}
