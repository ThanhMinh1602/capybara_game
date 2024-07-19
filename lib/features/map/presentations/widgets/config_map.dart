import 'package:capybara_game/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapData {
  final String imagePath;
  final List<int> levels;

  MapData({required this.imagePath, required this.levels});
}

final List<MapData> maps = [
  MapData(
    imagePath: Assets.images.maps.map1.path,
    levels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
  ),
  MapData(
    imagePath: Assets.images.maps.map2.path,
    levels: [11, 12, 13, 14, 15, 16, 17, 18, 19, 20],
  ),
  MapData(
    imagePath: Assets.images.maps.map3.path,
    levels: [21, 22, 23, 24, 25, 26, 27, 28, 29, 30],
  ),
  MapData(
    imagePath: Assets.images.maps.map4.path,
    levels: [31, 32, 33, 34, 35, 36, 37, 38, 39, 40],
  ),
  MapData(
    imagePath: Assets.images.maps.map5.path,
    levels: [41, 42, 43, 44, 45, 46, 47, 48, 49, 50],
  ),
];
Map<String, double> levelItemPosition(int level) {
  switch (level) {
    case 1:
      return {'left': 430.w, 'bottom': 20.h};
    case 2:
      return {'left': 480.w, 'bottom': 180.h};
    case 3:
      return {'left': 260.w, 'bottom': 200.h};
    case 4:
      return {'left': 40.w, 'bottom': 400.h};
    case 5:
      return {'left': 190.w, 'bottom': 530.h};
    case 6:
      return {'left': 280.w, 'bottom': 680.h};
    case 7:
      return {'left': 150.w, 'bottom': 800.h};
    case 8:
      return {'left': 150.w, 'bottom': 1000.h};
    case 9:
      return {'left': 330.w, 'bottom': 1100.h};
    case 10:
      return {'left': 130.w, 'bottom': 1200.h};
    case 11:
      return {'left': 550.w, 'bottom': 20.h};
    case 12:
      return {'left': 480.w, 'bottom': 180.h};
    case 13:
      return {'left': 260.w, 'bottom': 220.h};
    case 14:
      return {'left': 130.w, 'bottom': 320.h};
    case 15:
      return {'left': 400.w, 'bottom': 430.h};
    case 16:
      return {'left': 430.w, 'bottom': 680.h};
    case 17:
      return {'left': 330.w, 'bottom': 800.h};
    case 18:
      return {'left': 470.w, 'bottom': 980.h};
    case 19:
      return {'left': 330.w, 'bottom': 1180.h};
    case 20:
      return {'left': 130.w, 'bottom': 1240.h};
    case 21:
      return {'left': 460.w, 'bottom': 20.h};
    case 22:
      return {'left': 530.w, 'bottom': 180.h};
    case 23:
      return {'left': 260.w, 'bottom': 270.h};
    case 24:
      return {'left': 40.w, 'bottom': 440.h};
    case 25:
      return {'left': 190.w, 'bottom': 600.h};
    case 26:
      return {'left': 400.w, 'bottom': 670.h};
    case 27:
      return {'left': 580.w, 'bottom': 740.h};
    case 28:
      return {'left': 600.w, 'bottom': 1000.h};
    case 29:
      return {'left': 330.w, 'bottom': 1060.h};
    case 30:
      return {'left': 70.w, 'bottom': 1200.h};
    case 31:
      return {'left': 160.w, 'bottom': 20.h};
    case 32:
      return {'left': 300.w, 'bottom': 130.h};
    case 33:
      return {'left': 500.w, 'bottom': 200.h};
    case 34:
      return {'left': 540.w, 'bottom': 450.h};
    case 35:
      return {'left': 310.w, 'bottom': 480.h};
    case 36:
      return {'left': 60.w, 'bottom': 550.h};
    case 37:
      return {'left': 80.w, 'bottom': 720.h};
    case 38:
      return {'left': 600.w, 'bottom': 1000.h};
    case 39:
      return {'left': 330.w, 'bottom': 1060.h};
    case 40:
      return {'left': 70.w, 'bottom': 1200.h};
    default:
      return {'left': 275.w, 'bottom': 20.h};
  }
}
