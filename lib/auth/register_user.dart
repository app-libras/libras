import 'package:libras/db/db_service.dart';
import 'package:libras/db/db_tables.dart';
import 'package:sqflite/sqflite.dart';

class RegisterUser {
  late Database dbService;

  /// Adds a user to the database.
  ///
  /// This method adds a user with the given [name] to the database.
  /// It returns the id of the user that was just added.
  ///
  /// The [name] parameter is the name of the user to be added.
  ///
  /// The return value is a string representing the id of the user that was just added.
  Future<String> addUserToDatabase(String name) async {
    // Get the database instance
    dbService = await DbService.instance.database;

    // Insert the user into the user table
    // The return value is the id of the user that was just added
    final id = await dbService.insert(UserDbTables().user, {'name': name});

    // Return the id as a string
    return id.toString();
  }
}
