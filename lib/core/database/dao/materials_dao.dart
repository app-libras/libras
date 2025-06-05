import 'package:libras/core/constants/database_tables_name_constants.dart';
import 'package:libras/core/database/app_database.dart';

// import 'package:flutter/services.dart' show rootBundle;
// import 'dart:convert';

class MaterialsDao {
  final AppDatabase _appDatabase;

  MaterialsDao(this._appDatabase);

  Future<List<Map<String, dynamic>>> getMaterialsByAulaId(int id) async {
    print('getMaterialsByAulaId');
    print(id);
    final db = await _appDatabase.database;
    final result = await db.query(
      DatabaseTablesName.material,
      where: 'aula_id = ?',
      whereArgs: [id],
    );
    print(result);
    return result;
    // return db.query(
    //   DatabaseTablesName.material,
    //   where: 'aula_id = ?',
    //   whereArgs: [id],
    // );
  }

  Future<void> updateMaterials(Map<String, dynamic> row) async {
    final db = await _appDatabase.database;
    await db.update(
      DatabaseTablesName.material,
      row,
      where: 'id = ?',
      whereArgs: [row['id']],
    );
  }

  // Future<void> loadInitialData() async {
  //   final db = await _appDatabase.database;
  //   final jsonString = await rootBundle.loadString(
  //     'assets/aulas/1/materia.json',
  //   );
  //   final List<dynamic> jsonList = json.decode(jsonString);
  //   // final aulas = jsonList.map((json) => AulaModel.fromMap(json)).toList();
  //   for (var saudacao in jsonList) {
  //     await db.insert(DatabaseTablesName.saudacoes, saudacao);
  //   }
  // }
}
