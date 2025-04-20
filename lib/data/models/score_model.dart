import 'package:libras/domain/entities/score.dart';

class ScoreModel {
  final int? id;
  final int points;
  final int userId;
  final int level;

  ScoreModel({
    this.id,
    required this.points,
    required this.userId,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {'points': points, 'user_id': userId, 'level': level};
  }

  factory ScoreModel.fromMap(Map<String, dynamic> map) {
    return ScoreModel(
      id: map['_id'],
      points: map['points'],
      userId: map['user_id'],
      level: map['level'],
    );
  }

  Score toEntity() =>
      Score(id: id!, points: points, userId: userId, level: level);
}
