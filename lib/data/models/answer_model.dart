import 'package:librar/domain/entities/answer.dart';
import 'package:librar/domain/entities/materials.dart';

class AnswerModel {
  final int id;
  final String answer;

  AnswerModel({required this.id, required this.answer});

  factory AnswerModel.fromMaterial(Materials material) {
    return AnswerModel(id: material.id, answer: material.name);
  }
  Answer toEntity() => Answer(id: id, answer: answer);
}
