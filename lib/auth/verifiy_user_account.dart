import 'package:libras/db/db_service.dart';
import 'package:libras/db/db_tables.dart';
import 'package:sqflite/sqflite.dart';

class VerifiyUserAccount {
 late Database db;

  Future<bool> getUser() async {
    db = await DbService.instance.database;

    final user = await db.query(DbTables().user);

    final bool isUserVerified = user.isNotEmpty;

    return isUserVerified;
  }
}