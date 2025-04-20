// import 'package:flutter/material.dart';
import 'package:libras/domain/entities/score.dart';

abstract class ScoreRepository {
  Future<void> saveScore(Score score);
  Future<List<Score>> getScore();
}
