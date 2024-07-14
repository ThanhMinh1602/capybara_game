class PlayerModel {
  final int level;
  final int tries;
  final int ratingStar;

  PlayerModel({
    required this.level,
    required this.tries,
    required this.ratingStar,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      level: json['level'],
      tries: json['tries'],
      ratingStar: json['ratingStar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'level': level,
      'tries': tries,
      'ratingStar': ratingStar,
    };
  }
}
