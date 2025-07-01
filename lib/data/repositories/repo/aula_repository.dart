import 'package:librar/data/models/aula_model.dart';
import 'package:librar/domain/entities/aula.dart';

abstract class AulaRepository {
  Future<List<Aula>> getAllAulas();
  Future<void> addAula(AulaModel aula);
  Future<Aula> getAulaById(int id);
  Future<void> updateAula(AulaModel aula);
  // Future<void> deleteAula();
}
