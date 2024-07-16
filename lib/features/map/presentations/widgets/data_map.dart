import 'package:capybara_game/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapData {
  final String imagePath;
  final List<int> levels;

  MapData({required this.imagePath, required this.levels});
}

final List<MapData> maps = [
  MapData(
    imagePath: Assets.images.map1.path,
    levels: [1, 2, 3, 4, 5],
  ),
  MapData(
    imagePath: Assets.images.map2.path,
    levels: [6, 7, 8, 9, 10],
  ),
  MapData(
    imagePath: Assets.images.map3.path,
    levels: [11, 12, 13, 14, 15],
  ),
  MapData(
    imagePath: Assets.images.map4.path,
    levels: [16, 17, 18, 19, 20],
  ),
  MapData(
    imagePath: Assets.images.map5.path,
    levels: [21, 22, 23, 24, 25],
  ),
];
Map<String, double> levelItemPosition(int level) {
  switch (level) {
    case 1:
      return {'left': 275.w, 'bottom': 20.h};
    case 2:
      return {'left': 300.w, 'bottom': 320.h};
    case 3:
      return {'left': 220.w, 'bottom': 600.h};
    case 4:
      return {'left': 250.w, 'bottom': 880.h};
    case 5:
      return {'left': 340.w, 'bottom': 1150.h};
    case 6:
      return {'left': 340.w, 'bottom': 20.h};
    case 7:
      return {'left': 320.w, 'bottom': 320.h};
    case 8:
      return {'left': 300.w, 'bottom': 600.h};
    case 9:
      return {'left': 365.w, 'bottom': 880.h};
    case 10:
      return {'left': 390.w, 'bottom': 1150.h};
    default:
      return {'left': 275.w, 'bottom': 20.h};
  }
}
