class LevelModel {
  final int level;
  final int tries;
  final int score;
  final int ratingStar;

  LevelModel({
    required this.level,
    required this.tries,
    required this.score,
    required this.ratingStar,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) {
    return LevelModel(
      level: json['level'],
      tries: json['tries'],
      score: json['score'],
      ratingStar: json['ratingStar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'level': level,
      'tries': tries,
      'score': score,
      'ratingStar': ratingStar,
    };
  }
}
