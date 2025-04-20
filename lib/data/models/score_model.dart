class ScoreModel {
  final int? id;
  final int score;
  final int userId;
  final int level;

  ScoreModel({
    required this.id,
    required this.score,
    required this.userId,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {'score': score, 'user_id': userId, 'level': level};
  }

  factory ScoreModel.fromMap(Map<String, dynamic> map) {
    return ScoreModel(
      id: map['id'],
      score: map['score'],
      userId: map['user_id'],
      level: map['level'],
    );
  }
}
