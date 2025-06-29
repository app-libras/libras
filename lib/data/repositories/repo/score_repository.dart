// import 'package:flutter/material.dart';
import 'package:librar/data/models/score_model.dart';
import 'package:librar/domain/entities/score.dart';

abstract class ScoreRepository {
  Future<List<Score>> getScore();
  Future<void> addScore(ScoreModel score);
  Future<void> updateScore(ScoreModel score);
}
