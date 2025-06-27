import 'package:libras/domain/entities/score.dart';

class ScoreModel {
  final int? id;
  int points;
  int userId;
  int level;

  ScoreModel({
    this.id,
    required this.points,
    required this.userId,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'points': points, 'user_id': userId, 'level': level};
  }

  factory ScoreModel.fromMap(Map<String, dynamic> map) {
    return ScoreModel(
      id: map['id'],
      points: map['points'],
      userId: map['user_id'],
      level: map['level'],
    );
  }

  factory ScoreModel.fromEntity(Score score) {
    return ScoreModel(
      id: score.id,
      points: score.points,
      userId: score.userId,
      level: score.level,
    );
  }

  Score toEntity() =>
      Score(id: id!, points: points, userId: userId, level: level);
}
