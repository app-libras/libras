import 'package:librar/core/constants/database_tables_name_constants.dart';
import 'package:librar/core/database/app_database.dart';

class UserDao {
  final AppDatabase _appDatabase;

  UserDao(this._appDatabase);

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await _appDatabase.database;

    return db.query(DatabaseTablesName.user);
  }

  Future<void> insertUser(Map<String, dynamic> row) async {
    final db = await _appDatabase.database;
    try {
      await db.insert(DatabaseTablesName.user, row);
    } catch (e) {
      // debugPrint(e);
    }
  }

  Future<void> updateUser(Map<String, dynamic> row) async {
    final db = await _appDatabase.database;

    await db.update('user', row, where: 'id = ?', whereArgs: [row['id']]);
  }
}
