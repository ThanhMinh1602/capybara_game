class LevelModel {
  final int level;
  final int ratingStar;
  final double left;
  final double bottom;

  LevelModel({
    required this.level,
    required this.ratingStar,
    required this.left,
    required this.bottom,
  });
}

class MapData {
  final String imagePath;
  final List<LevelModel> levels;

  MapData({
    required this.imagePath,
    required this.levels,
  });
}
