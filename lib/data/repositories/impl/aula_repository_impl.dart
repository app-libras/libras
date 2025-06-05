import 'package:libras/core/database/dao/aula_dao.dart';
import 'package:libras/data/models/aula_model.dart';
import 'package:libras/domain/entities/aula.dart';
import 'package:libras/domain/repositories/aula_repository.dart';

class AulaRepositoryImpl implements AulaRepository {
  final AulaDao _aulaDao;

  AulaRepositoryImpl(this._aulaDao);

  @override
  Future<List<Aula>> getAllAulas() async {
    final result = await _aulaDao.getAllAulas();
    return result.map((e) => AulaModel.fromMap(e).toEntity()).toList();
  }

  @override
  Future<void> addAula(AulaModel aula) async {
    await _aulaDao.insertAula(aula.toMap());
  }
}
