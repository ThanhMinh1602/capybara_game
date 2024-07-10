import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:capybara_game/common/navigator/navigator.dart';
import 'package:capybara_game/features/splash/usecase/count_down_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppNavigator appNavigator;
  final CountDownUseCase countDownUsecase;

  SplashBloc({required this.appNavigator, required this.countDownUsecase})
      : super(const SplashState()) {
    on(_onInit);
    add(const SplashInitializeEvent());
  }
}

extension EventHandle on SplashBloc {
  Future<void> _onInit(
      SplashInitializeEvent event, Emitter<SplashState> emitter) async {
    await countDownUsecase();
    appNavigator.pushAndRemoveUntil(screen: const ScreenTypeStart());
  }
}
