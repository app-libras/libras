import 'package:libras/domain/entities/aula.dart';

class AulaModel {
  final int id;
  final String name;
  bool isStart;
  bool isFinish;
  int step;

  AulaModel({
    required this.id,
    required this.name,
    required this.isStart,
    required this.isFinish,
    required this.step,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'is_start': isStart ? 1 : 0,
      'is_finish': isFinish ? 1 : 0,
      'step': step,
    };
  }

  factory AulaModel.fromMap(Map<String, dynamic> map) {
    return AulaModel(
      id: map['id'],
      name: map['name'],
      isStart: map['is_start'] == 1 ? true : false,
      isFinish: map['is_finish'] == 1 ? true : false,
      step: map['step'],
    );
  }

  Aula toEntity() => Aula(
    id: id,
    name: name,
    isStart: isStart,
    isFinish: isFinish,
    step: step,
  );

  factory AulaModel.fromEntity(Aula aula) => AulaModel(
    id: aula.id,
    name: aula.name,
    isStart: aula.isStart,
    isFinish: aula.isFinish,
    step: aula.step,
  );
}
