import 'package:libras/core/constants/database_tables_name_constants.dart';
import 'package:libras/core/database/app_database.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class SaudacaoDao {
  final AppDatabase _appDatabase;

  SaudacaoDao(this._appDatabase);

  Future<List<Map<String, dynamic>>> getAllSaudacao() async {
    final db = await _appDatabase.database;
    return db.query(DatabaseTablesName.saudacoes);
  }

  Future<void> insertSaudacao(Map<String, dynamic> row) async {
    final db = await _appDatabase.database;
    await db.insert(DatabaseTablesName.saudacoes, row);
  }

  Future<void> loadInitialData() async {
    final db = await _appDatabase.database;
    final jsonString = await rootBundle.loadString(
      'assets/aulas/1/materia.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    // final aulas = jsonList.map((json) => AulaModel.fromMap(json)).toList();
    for (var saudacao in jsonList) {
      await db.insert(DatabaseTablesName.saudacoes, saudacao);
    }
  }
}
