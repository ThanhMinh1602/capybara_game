part of 'navigator.dart';

@freezed
class ScreenType with _$ScreenType {
  const factory ScreenType.splash() = ScreenTypeSplash;
}

class ScreenTypeHelper {
  static Widget page(ScreenType screenType) {
    return screenType.when(
      splash: () => const SplashPage(),
    );
  }
}
