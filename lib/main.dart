import 'package:flutter/material.dart';
import 'package:libras/app.dart';
import 'package:libras/core/database/app_database.dart';
import 'package:libras/core/database/dao/user_dao.dart';
import 'package:libras/data/repositories/user_repository.dart';
import 'package:libras/data/repositories/user_repository_impl.dart';
import 'package:libras/presentation/viewmodels/user_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize the database
  final appDatabase = AppDatabase.instance;

  final userDao = UserDao(appDatabase);

  runApp(
    MultiProvider(
      providers:[
        Provider<UserDao>(create: (_) => userDao),
        Provider<UserRepository>(
          create: (context) => UserRepositoryImpl(context.read<UserDao>()),
        ),
        ChangeNotifierProvider(
          create: (context) => UserViewModel(context.read<UserRepository>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
