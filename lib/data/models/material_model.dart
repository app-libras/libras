import 'package:librar/domain/entities/materials.dart';

class MaterialsModel {
  final int id;
  final String name;
  final String path;
  final bool hasTwoPath;
  final bool isQuestion;
  final bool isAnswer;
  final int isMaterial;
  final int aulaId;

  MaterialsModel({
    required this.id,
    required this.name,
    required this.path,
    required this.hasTwoPath,
    this.isQuestion = false,
    this.isAnswer = false,
    required this.isMaterial,
    required this.aulaId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'path': path,
      'is_question': isQuestion ? 1 : 0,
      'is_answer': isAnswer ? 1 : 0,
      'is_material': isMaterial,
      'aula_id': aulaId,
    };
  }

  factory MaterialsModel.fromMap(Map<String, dynamic> map) {
    return MaterialsModel(
      id: map['id'],
      name: map['name'],
      path: map['path'],
      hasTwoPath: map['has_two_path'] == 1 ? true : false,
      isQuestion: map['is_question'] == 1 ? true : false,
      isAnswer: map['is_answer'] == 1 ? true : false,
      isMaterial: map['is_material'],
      aulaId: map['aula_id'],
    );
  }

  Materials toEntity() => Materials(
    id: id,
    name: name,
    path: path,
    hasTwoPath: hasTwoPath,
    isQuestion: isQuestion,
    isAnswer: isAnswer,
    isMaterial: isMaterial,
    aulaId: aulaId,
  );
}
