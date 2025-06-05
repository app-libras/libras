import 'package:libras/data/models/material_model.dart';
import 'package:libras/domain/entities/materials.dart';

abstract class MaterialsRepository {
  Future<List<Materials>> getAllMaterials();

  Future<void> addMaterials(MaterialsModel material);
}
