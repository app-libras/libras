import 'package:flutter/material.dart';
import 'package:libras/db/db_tables.dart';
import 'package:provider/provider.dart';
import 'package:libras/models/user_model.dart';
import 'package:libras/db/db_service.dart';
import 'package:sqflite/sqflite.dart';

class UserProvider extends ChangeNotifier {
  late Database dbService;
  UserModel? _user;
  UserModel? get user => _user;
}
