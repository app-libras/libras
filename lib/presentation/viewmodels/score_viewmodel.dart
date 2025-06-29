import 'package:flutter/material.dart';
import 'package:librar/data/models/score_model.dart';
import 'package:librar/data/repositories/repo/score_repository.dart';
import 'package:librar/domain/entities/score.dart';

class ScoreViewModel with ChangeNotifier {
  final ScoreRepository _scoreRepository;
  List<Score> _score = [];

  List<Score> get score => _score;
  bool get isScore => _score.isNotEmpty;

  ScoreViewModel(this._scoreRepository);

  Future<void> loadScore() async {
    try {
      _score = await _scoreRepository.getScore();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      notifyListeners();
    }
  }

  Future<void> addScore(int userId, int points, int level) async {
    final score = ScoreModel(
      id: 1,
      points: points,
      userId: userId,
      level: level,
    );
    try {
      await _scoreRepository.addScore(score);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      await loadScore();
      notifyListeners();
    }
  }

  Future<void> updateScorePoints(int points) async {
    ScoreModel newScore = _score.map((e) => ScoreModel.fromEntity(e)).first;
    newScore.points = points;
    try {
      await _scoreRepository.updateScore(newScore);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      await loadScore();
      notifyListeners();
    }
  }

  Future<void> updateScoreLevel(int level) async {
    ScoreModel newScore = _score.map((e) => ScoreModel.fromEntity(e)).first;
    newScore.level = level;
    try {
      await _scoreRepository.updateScore(newScore);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      await loadScore();
      notifyListeners();
    }
  }
}
