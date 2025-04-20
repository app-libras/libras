import 'package:flutter/material.dart';
import 'package:libras/app.dart';
import 'package:libras/core/database/app_database.dart';
import 'package:libras/core/database/dao/score_dao.dart';
import 'package:libras/core/database/dao/user_dao.dart';
import 'package:libras/data/repositories/score_repository.dart';
import 'package:libras/data/repositories/score_repository_impl.dart';
import 'package:libras/data/repositories/user_repository.dart';
import 'package:libras/data/repositories/user_repository_impl.dart';
import 'package:libras/presentation/viewmodels/score_viewmodel.dart';
import 'package:libras/presentation/viewmodels/user_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the database
  final appDatabase = AppDatabase.instance;

  final userDao = UserDao(appDatabase);
  final scoreDao = ScoreDao(appDatabase);

  runApp(
    MultiProvider(
      providers: [
        Provider<UserDao>(create: (_) => userDao),
        Provider<UserRepository>(
          create: (context) => UserRepositoryImpl(context.read<UserDao>()),
        ),
        Provider<ScoreDao>(create: (_) => scoreDao),
        Provider<ScoreRepository>(
          create: (context) => ScoreRepositoryImpl(context.read<ScoreDao>()),
        ),
        ChangeNotifierProvider(
          create: (context) => UserViewModel(context.read<UserRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => ScoreViewModel(context.read<ScoreRepository>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
