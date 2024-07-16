class PlayerModel {
  final int level;
  final int tries;
  final int ratingStar;

  PlayerModel({
    required this.level,
    required this.tries,
    required this.ratingStar,
  });

  PlayerModel copyWith({
    int? level,
    int? tries,
    int? ratingStar,
  }) {
    return PlayerModel(
      level: level ?? this.level,
      tries: tries ?? this.tries,
      ratingStar: ratingStar ?? this.ratingStar,
    );
  }

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
