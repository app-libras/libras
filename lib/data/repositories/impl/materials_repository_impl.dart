import 'package:librar/core/database/dao/materials_dao.dart';
import 'package:librar/data/models/material_model.dart';
import 'package:librar/data/repositories/repo/materials_repository.dart';
import 'package:librar/domain/entities/materials.dart';

class MaterialsRepositoryImpl implements MaterialsRepository {
  final MaterialsDao _materialsDao;

  MaterialsRepositoryImpl(this._materialsDao);

  @override
  Future<List<Materials>> getMaterialsByAulaId(int id) async {
    final result = await _materialsDao.getMaterialsByAulaId(id);
    return result.map((e) => MaterialsModel.fromMap(e).toEntity()).toList();
  }

  @override
  Future<void> updateMaterials(MaterialsModel material) async {
    await _materialsDao.updateMaterials(material.toMap());
  }
}
