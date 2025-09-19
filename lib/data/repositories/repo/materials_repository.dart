import 'package:librar/data/models/material_model.dart';
import 'package:librar/domain/entities/materials.dart';

abstract class MaterialsRepository {
  Future<List<Materials>> getMaterialsByAulaId(int id);

  Future<void> updateMaterials(MaterialsModel material);

  Future<List<Materials>> getAllMaterialsExcept();
}
