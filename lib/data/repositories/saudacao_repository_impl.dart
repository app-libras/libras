import 'package:libras/core/database/dao/saudacao_dao.dart';
import 'package:libras/data/models/saudacao_model.dart';
import 'package:libras/data/repositories/saudacao_repository.dart';
import 'package:libras/domain/entities/saudacao.dart';

class SaudacaoRepositoryImpl implements SaudacaoRepository {
  final SaudacaoDao _saudacaoDao;

  SaudacaoRepositoryImpl(this._saudacaoDao);

  @override
  Future<List<Saudacao>> getAllSaudacao() async {
    final result = await _saudacaoDao.getAllSaudacao();
    return result.map((e) => SaudacaoModel.fromMap(e).toEntity()).toList();
  }

  @override
  Future<void> addSaudacao(SaudacaoModel saudacao) async {
    await _saudacaoDao.insertSaudacao(saudacao.toMap());
  }
}
