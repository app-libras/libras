import 'package:libras/data/models/material_model.dart';
import 'package:libras/domain/entities/materials.dart';

abstract class MaterialsRepository {
  Future<List<Materials>> getMaterialsByAulaId(int id);

  Future<void> updateMaterials(MaterialsModel material);
}
