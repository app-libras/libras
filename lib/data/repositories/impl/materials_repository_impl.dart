import 'package:libras/core/database/dao/materials_dao.dart';
import 'package:libras/data/models/material_model.dart';
import 'package:libras/data/repositories/repo/materials_repository.dart';
import 'package:libras/domain/entities/materials.dart';

class MaterialsRepositoryImpl implements MaterialsRepository {
  final MaterialsDao _materialsDao;

  MaterialsRepositoryImpl(this._materialsDao);

  @override
  Future<List<Materials>> getAllMaterials() async {
    final result = await _materialsDao.getAllMaterials();
    return result.map((e) => MaterialsModel.fromMap(e).toEntity()).toList();
  }

  @override
  Future<void> addMaterials(MaterialsModel materials) async {
    await _materialsDao.insertMaterials(materials.toMap());
  }
}
