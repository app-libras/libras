// import 'package:flutter/material.dart';
import 'package:libras/data/models/score_model.dart';
import 'package:libras/domain/entities/score.dart';

abstract class ScoreRepository {
  Future<List<Score>> getScore();
  Future<void> addScore(ScoreModel score);
  Future<void> updateScore(ScoreModel score);
}
