import 'package:librar/core/database/dao/score_dao.dart';
import 'package:librar/data/models/score_model.dart';
import 'package:librar/data/repositories/repo/score_repository.dart';
import 'package:librar/domain/entities/score.dart';

class ScoreRepositoryImpl implements ScoreRepository {
  final ScoreDao _scoreDao;

  ScoreRepositoryImpl(this._scoreDao);

  @override
  Future<List<Score>> getScore() async {
    final result = await _scoreDao.getAllScore();
    return result.map((e) => ScoreModel.fromMap(e).toEntity()).toList();
  }

  @override
  Future<void> addScore(ScoreModel score) {
    return _scoreDao.insertScore(score.toMap());
  }

  @override
  Future<void> updateScore(ScoreModel score) {
    return _scoreDao.updateScore(score.toMap());
  }
}
