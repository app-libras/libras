import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// import 'package:librar/core/database/database_tables.dart';
import 'package:librar/core/constants/database_init_constants.dart';

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
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String appPath = appDir.path;

    final String dbPath = join(
      appPath,
      'databases',
      DatabaseInitConstants.databaseName,
    );

    if (!await Directory(dirname(dbPath)).exists()) {
      await Directory(dirname(dbPath)).create(recursive: true);
    }

    if (!await File(dbPath).exists()) {
      ByteData data = await rootBundle.load(
        join(DatabaseInitConstants.assetsPath),
      );
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      await File(dbPath).writeAsBytes(bytes, flush: true);
    }

    return dbPath;
  }

  Future<Database> initialize() async {
    final dbPath = await _databasePath;
    debugPrint('Database path: $dbPath');
    return openDatabase(
      dbPath,
      version: DatabaseInitConstants.databaseVersion,
      onOpen: (db) {}, // Just open, don't do anything
    );
  }

  // Future<void> _onCreate(Database db, int version) async {
  //   await db.execute('PRAGMA foreign_keys = ON');
  //   await db.execute(UserTables().userTables);
  //   await db.execute(ScoreTables().scoreTables);
  //   await db.execute(AulaTables().aulaTables);
  //   await db.execute(SaudacoesTables().saudacoesTables);
  // }
}
