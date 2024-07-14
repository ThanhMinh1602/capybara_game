import 'package:bloc/bloc.dart';
import 'package:capybara_game/common/navigator/navigator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_event.dart';
part 'map_state.dart';
part 'map_bloc.freezed.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final AppNavigator appNavigator;
  MapBloc({required this.appNavigator}) : super(const MapState()) {
    on(onChooseLevel);
  }
}

extension MapBlocExtension on MapBloc {
  void onInit(MapEvent event, Emitter<MapState> emitter) {
    
  }
  void onChooseLevel(ChooseLevelEvent event, Emitter<MapState> emitter) {
    appNavigator.push(screen: ScreenType.player(event.levelNumber));
  }
}
