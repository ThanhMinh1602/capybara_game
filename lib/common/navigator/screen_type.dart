part of 'navigator.dart';

@freezed
class ScreenType with _$ScreenType {
  const factory ScreenType.splash() = ScreenTypeSplash;
  const factory ScreenType.start() = ScreenTypeStart;
  const factory ScreenType.map() = ScreenTypeMap;
  const factory ScreenType.player(int level) = ScreenTypePlayer;
}

class ScreenTypeHelper {
  static Widget page(ScreenType screenType) {
    return screenType.when(
      splash: () => const SplashPage(),
      start: () => const StartPage(),
      map: () => const MapPage(),
      player: (level) => PlayerPage(level: level),
    );
  }
}
