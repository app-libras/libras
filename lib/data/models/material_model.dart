import 'package:libras/domain/entities/materials.dart';

class MaterialsModel {
  final int id;
  final String name;
  final String path;
  final bool isQuestion;
  final bool isAnswer;
  final int aulaId;

  MaterialsModel({
    required this.id,
    required this.name,
    required this.path,
    this.isQuestion = false,
    this.isAnswer = false,
    required this.aulaId,
  });

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'path': path,
      'is_question': isQuestion ? 1 : 0,
      'is_answer': isAnswer ? 1 : 0,
      'aula_id': aulaId,
    };
  }

  factory MaterialsModel.fromMap(Map<String, dynamic> map) {
    return MaterialsModel(
      id: map['_id'],
      name: map['name'],
      path: map['path'],
      isQuestion: map['is_question'] ?? false,
      isAnswer: map['is_answer'] ?? false,
      aulaId: map['aula_id'],
    );
  }

  Materials toEntity() => Materials(
    id: id,
    name: name,
    path: path,
    isQuestion: isQuestion,
    isAnswer: isAnswer,
    aulaId: aulaId,
  );
}
