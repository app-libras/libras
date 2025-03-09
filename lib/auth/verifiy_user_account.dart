import 'package:libras/db/db_service.dart';
import 'package:libras/db/db_tables.dart';
import 'package:sqflite/sqflite.dart';

class VerifiyUserAccount {
  late Database db;

  /// Verifies if the user is registered in the database.
  ///
  /// This method will check if the user table is not empty.
  /// If the user table is not empty, it means the user is already registered.
  /// If the user table is empty, it means the user is not registered yet.
  ///
  /// Returns [true] if the user is already registered and [false] if the user is not registered yet.
  Future<bool> getUser() async {
    // Get the database instance
    db = await DbService.instance.database;

    // Select the user table
    final user = await db.query(UserDbTables().user);

    // Check if the user table is not empty
    final bool isUserVerified = user.isNotEmpty;

    // Return true if the user is already registered and false if the user is not registered yet
    return isUserVerified;
  }
}
