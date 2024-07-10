import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on(onChooseOption);
  }
}

extension AppBlocExtension on AppBloc {
  void onChooseOption(
      ChooseOptionSettingEvent event, Emitter<AppState> emitter) {
    emitter(state.copyWith(option: event.option));
  }
}
