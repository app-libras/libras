import 'package:libras/db/db_tables.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbService{
  DbService._();
  static final DbService instance = DbService._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initialize();
    return _database!;
  }

  Future<String> get _dbPath async {
    final directory = await getDatabasesPath();
    return join(directory, 'libras.db');
  }

  Future<Database> initialize() async {
    final path = await _dbPath;
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(UserDbTables().userTables);
    await db.execute(ScoreDbTables().scoreTables);
  }
}