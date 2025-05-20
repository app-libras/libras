import 'package:libras/domain/entities/saudacao.dart';

class SaudacaoModel {
  final int id;
  final String name;
  final String path;
  final int aulaId;

  SaudacaoModel({
    required this.id,
    required this.name,
    required this.path,
    required this.aulaId,
  });

  Map<String, dynamic> toMap() {
    return {'_id': id, 'name': name, 'path': path, 'aula_id': aulaId};
  }

  factory SaudacaoModel.fromMap(Map<String, dynamic> map) {
    return SaudacaoModel(
      id: map['_id'],
      name: map['name'],
      path: map['path'],
      aulaId: map['aula_id'],
    );
  }

  Saudacao toEntity() =>
      Saudacao(id: id, name: name, path: path, aulaId: aulaId);
}
