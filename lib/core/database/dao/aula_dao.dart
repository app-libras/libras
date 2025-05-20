import 'package:libras/core/database/app_database.dart';
import 'package:libras/core/constants/database_tables_name_constants.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class AulaDao {
  final AppDatabase _appDatabase;

  AulaDao(this._appDatabase);

  Future<List<Map<String, dynamic>>> getAllAulas() async {
    final db = await _appDatabase.database;
    return db.query(DatabaseTablesName.aula);
  }

  Future<void> insertAula(Map<String, dynamic> row) async {
    final db = await _appDatabase.database;
    await db.insert(DatabaseTablesName.aula, row);
  }

  Future<void> updateAula(Map<String, dynamic> row) async {
    final db = await _appDatabase.database;
    await db.update(
      DatabaseTablesName.aula,
      row,
      where: 'id = ?',
      whereArgs: [row['id']],
    );
  }

  Future<void> loadInitialData() async {
    final db = await _appDatabase.database;
    final jsonString = await rootBundle.loadString('assets/aulas/1/aulas.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    // final aulas = jsonList.map((json) => AulaModel.fromMap(json)).toList();
    for (var aula in jsonList) {
      await db.insert(DatabaseTablesName.aula, aula);
    }
  }
}
