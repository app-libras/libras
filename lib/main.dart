import 'package:flutter/material.dart';
import 'package:librar/app.dart';
import 'package:librar/core/database/app_database.dart';
import 'package:librar/core/database/dao/aula_dao.dart';
import 'package:librar/core/database/dao/materials_dao.dart';
import 'package:librar/core/database/dao/score_dao.dart';
import 'package:librar/core/database/dao/user_dao.dart';
import 'package:librar/data/repositories/repo/materials_repository.dart';
import 'package:librar/data/repositories/impl/materials_repository_impl.dart';
import 'package:librar/data/repositories/repo/score_repository.dart';
import 'package:librar/data/repositories/impl/score_repository_impl.dart';
import 'package:librar/data/repositories/repo/user_repository.dart';
import 'package:librar/data/repositories/impl/user_repository_impl.dart';
import 'package:librar/data/repositories/repo/aula_repository.dart';
import 'package:librar/data/repositories/impl/aula_repository_impl.dart';
import 'package:librar/presentation/viewmodels/materials_viewmodel.dart';
import 'package:librar/presentation/viewmodels/score_viewmodel.dart';
import 'package:librar/presentation/viewmodels/user_viewmodel.dart';
import 'package:librar/presentation/viewmodels/aulas_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the database
  final appDatabase = AppDatabase.instance;

  final userDao = UserDao(appDatabase);
  final scoreDao = ScoreDao(appDatabase);
  final aulaDao = AulaDao(appDatabase);
  final saudacao = MaterialsDao(appDatabase);

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
        Provider<AulaDao>(create: (_) => aulaDao),
        Provider<AulaRepository>(
          create: (context) => AulaRepositoryImpl(context.read<AulaDao>()),
        ),
        Provider<MaterialsDao>(create: (_) => saudacao),
        Provider<MaterialsRepository>(
          create: (context) =>
              MaterialsRepositoryImpl(context.read<MaterialsDao>()),
        ),
        ChangeNotifierProvider(
          create: (context) => UserViewModel(context.read<UserRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => ScoreViewModel(context.read<ScoreRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              MaterialsViewModel(context.read<MaterialsRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => AulasViewModel(context.read<AulaRepository>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
