import 'package:libras/data/models/saudacao_model.dart';
import 'package:libras/domain/entities/saudacao.dart';

abstract class SaudacaoRepository {
  Future<List<Saudacao>> getAllSaudacao();

  Future<void> addSaudacao(SaudacaoModel saudacao);
}
