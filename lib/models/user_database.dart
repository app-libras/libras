import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:libras/models/user.dart';
import 'package:path_provider/path_provider.dart';

class UserDatabase extends ChangeNotifier {
  static late Isar isar;

  /// Initializes the [Isar] instance for the [User] schema.
  ///
  /// This method opens an [Isar] instance in the application's documents directory,
  /// with the [UserSchema] as the only schema.
  ///
  /// Returns a [Future] that completes when the [Isar] instance is successfully
  /// initialized.
  static Future<void> initialize() async {
    // Get the path to the application's documents directory
    final dir = await getApplicationDocumentsDirectory();

    // Open the Isar instance with the UserSchema in the documents directory
    isar = await Isar.open(
      [UserSchema],
      directory: dir.path,
    );
  }

  late User user;

  Future<void> saveUser(userInfo) async {
    final newUser = User()..name = userInfo;
    await isar.writeTxn(() async {
      await isar.users.put(newUser);
    });
    getUser();
  }

  Future<void> getUser() async {
    // Get the user with id 1
    final User? fetchUser = await isar.users.get(1);
    user = fetchUser ?? User();
    // print(user.name.isEmpty);
    notifyListeners();
  }

  Future<void> updataUser(int id, User userUpdateInfo) async {
    await isar.writeTxn(() async {
      await isar.users.put(userUpdateInfo);
      await getUser();
    });
  }

  Future<void> deleteUser() async {
    await isar.writeTxn(() async {
      await isar.users.delete(1);
    });
  }
}
