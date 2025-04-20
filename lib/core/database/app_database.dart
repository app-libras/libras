import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:libras/core/database/database_tables.dart';
import 'package:libras/core/constants/database_init_constants.dart';

class AppDatabase {
  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();
  
  
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initialize();
    return _database!;
  }

  Future<String> get _databasePath async {
    final directory = await getDatabasesPath();
    return join(directory, DatabaseInitConstants.databaseName);
  }

  Future<Database> initialize() async {
    final path = await _databasePath;
    return await openDatabase(
      path,
      version: DatabaseInitConstants.databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(UserTables().userTables);
    await db.execute(ScoreTables().scoreTables);
  }
}
