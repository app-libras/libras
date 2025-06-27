import 'dart:math';

import 'package:libras/domain/entities/answer.dart';
import 'package:libras/domain/entities/materials.dart';
import 'package:libras/domain/entities/question.dart';

class QuestionModel {
  final int id;
  final String name;
  final String path;
  final bool isQuestion;
  final bool isAnswer;
  final int aulaId;
  final List<Answer> answer;

  QuestionModel({
    required this.id,
    required this.name,
    required this.path,
    required this.isQuestion,
    required this.isAnswer,
    required this.aulaId,
    required this.answer,
  });

  Map<String, dynamic> toMap() {
    return {'answer': answer};
  }

  factory QuestionModel.fromMaterial(Materials material, List<Answer> answer) {
    List<Answer> newAnswer = [];
    String path = material.path;

    List<Answer> aux =
        List.of(answer).where((e) => e.id != material.id).toList();
    aux.shuffle(Random());

    int count = min(5, aux.length);
    newAnswer = aux.sublist(0, count);


    newAnswer.add(Answer(id: material.id, answer: material.name));

    newAnswer.shuffle(Random());

    if(material.hasTwoPath) {
      final List k = material.path.split('.');
      path = '${k[0]}Q.${k[1]}';
      
    }

    return QuestionModel(
      id: material.id,
      name: material.name,
      path: path,
      isQuestion: material.isQuestion,
      isAnswer: material.isAnswer,
      aulaId: material.aulaId,
      answer: newAnswer,
    );
  }

  Question toEntity() => Question(
    id: id,
    name: name,
    path: path,
    isQuestion: isQuestion,
    isAnswer: isAnswer,
    aulaId: aulaId,
    answer: answer,
  );
}
