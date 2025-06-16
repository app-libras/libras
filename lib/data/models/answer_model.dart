import 'package:libras/domain/entities/answer.dart';
import 'package:libras/domain/entities/materials.dart';

class AnswerModel {
  final int id;
  final String answer;

  AnswerModel({required this.id, required this.answer});

  Map<String, dynamic> toMap() {
    return {'id': id, 'answer': answer};
  }

  factory AnswerModel.fromMaterial(Materials material) {
    print(material);
    return AnswerModel(id: material.id, answer: material.name);
  }
  Answer toEntity() => Answer(id: id, answer: answer);
}
