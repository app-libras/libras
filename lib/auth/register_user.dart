import 'package:libras/db/db_service.dart';
import 'package:libras/db/db_tables.dart';
import 'package:sqflite/sqflite.dart';

class RegisterUser {
  late Database dbService;

  Future<String>  addUserToDatabase(String name) async {
    dbService = await DbService.instance.database;
    final id = await dbService.insert(DbTables().user, {'name': name});

    print(id);

    return id.toString();
  }
}