import 'package:flutter/material.dart';
import 'package:libras/data/models/score_model.dart';
import 'package:libras/data/repositories/repo/score_repository.dart';
import 'package:libras/domain/entities/score.dart';

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
    final score = ScoreModel(points: points, userId: userId, level: level);
    try {
      await _scoreRepository.addScore(score);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      await loadScore();
      notifyListeners();
    }
  }
}
