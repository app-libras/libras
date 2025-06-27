import 'package:librar/core/database/dao/aula_dao.dart';
import 'package:librar/data/models/aula_model.dart';
import 'package:librar/domain/entities/aula.dart';
import 'package:librar/data/repositories/repo/aula_repository.dart';

class AulaRepositoryImpl implements AulaRepository {
  final AulaDao _aulaDao;

  AulaRepositoryImpl(this._aulaDao);

  @override
  Future<List<Aula>> getAllAulas() async {
    final result = await _aulaDao.getAllAulas();
    return result.map((e) => AulaModel.fromMap(e).toEntity()).toList();
  }

  @override
  Future<Aula> getAulaById(int id) async {
    final result = await _aulaDao.getAulaById(id);
    return AulaModel.fromMap(result).toEntity();
  }

  @override
  Future<void> addAula(AulaModel aula) async {
    await _aulaDao.insertAula(aula.toMap());
  }

  @override
  Future<void> updateAula(AulaModel aula) async {
    await _aulaDao.updateAula(aula.toMap());
  }
}
