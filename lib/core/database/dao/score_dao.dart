import 'package:libras/core/constants/database_tables_name_constants.dart';
import 'package:libras/core/database/app_database.dart';

class ScoreDao {
  final AppDatabase _appDatabase;

  ScoreDao(this._appDatabase);

  Future<List<Map<String, dynamic>>> getAllScore() async {
    final db = await _appDatabase.database;
    return db.query(DatabaseTablesName.score);
  }

  Future<void> insertScore(Map<String, dynamic> row) async {
    final db = await _appDatabase.database;
    await db.insert(DatabaseTablesName.score, row);
  }

  Future<void> updateScore(Map<String, dynamic> row) async {
    final db = await _appDatabase.database;
    await db.update(
      DatabaseTablesName.score,
      row,
      where: 'id = ?',
      whereArgs: [row['id']],
    );
  }
}
