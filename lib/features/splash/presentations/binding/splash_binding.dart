import 'package:capybara_game/common/extensions/build_context_extension.dart';
import 'package:capybara_game/features/splash/presentations/bloc/splash_bloc.dart';
import 'package:capybara_game/features/splash/usecase/count_down_usecase.dart';
import 'package:flutter/widgets.dart';

class SplashBinding {
  static SplashBloc generateBloc(BuildContext context) {
    return SplashBloc(
      appNavigator: context.getNavigator(),
      countDownUsecase: CountDownUseCase(),
    );
  }
}
