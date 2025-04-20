import 'package:libras/core/constants/database_tables_name_constants.dart';
import 'package:libras/core/database/app_database.dart';

class UserDao {
  final AppDatabase _appDatabase;

  UserDao(this._appDatabase);

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await _appDatabase.database;

    return db.query(DatabaseTablesName.user);
  }

  Future<void> insertUser(Map<String, dynamic> row) async {
    final db = await _appDatabase.database;
    print(row);
    await db.insert(DatabaseTablesName.user, row);
  }

  Future<void> updateUser(Map<String, dynamic> row) async {
    final db = await _appDatabase.database;

    await db.update('user', row, where: 'id = ?', whereArgs: [row['id']]);
  }
}
