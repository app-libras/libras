import 'package:libras/domain/entities/aula.dart';

class AulaModel {
  final int id;
  final String name;
  final bool start;
  final int step;

  AulaModel({
    required this.id,
    required this.name,
    required this.start,
    required this.step,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'start': start, 'step': step};
  }

  factory AulaModel.fromMap(Map<String, dynamic> map) {
    return AulaModel(
      id: map['id'],
      name: map['name'],
      start: map['start'],
      step: map['step'],
    );
  }

  Aula toEntity() => Aula(id: id, name: name, start: start, step: step);
}
