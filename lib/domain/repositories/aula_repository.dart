import 'package:libras/data/models/aula_model.dart';
import 'package:libras/domain/entities/aula.dart';

abstract class AulaRepository {
  Future<List<Aula>> getAllAulas();
  Future<void> addAula(AulaModel aula);
  // Future<void> updateAula();
  // Future<void> deleteAula();
}
