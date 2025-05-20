import 'package:flutter/material.dart';
import 'package:libras/app.dart';
import 'package:libras/core/database/app_database.dart';
import 'package:libras/core/database/dao/aula_dao.dart';
import 'package:libras/core/database/dao/saudacao_dao.dart';
import 'package:libras/core/database/dao/score_dao.dart';
import 'package:libras/core/database/dao/user_dao.dart';
import 'package:libras/data/repositories/saudacao_repository.dart';
import 'package:libras/data/repositories/saudacao_repository_impl.dart';
import 'package:libras/data/repositories/score_repository.dart';
import 'package:libras/data/repositories/score_repository_impl.dart';
import 'package:libras/data/repositories/user_repository.dart';
import 'package:libras/data/repositories/user_repository_impl.dart';
import 'package:libras/domain/repositories/aula_repository.dart';
import 'package:libras/domain/repositories/aula_repository_impl.dart';
import 'package:libras/presentation/viewmodels/class_content_viewmodel.dart';
import 'package:libras/presentation/viewmodels/score_viewmodel.dart';
import 'package:libras/presentation/viewmodels/user_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the database
  final appDatabase = AppDatabase.instance;

  final userDao = UserDao(appDatabase);
  final scoreDao = ScoreDao(appDatabase);
  final aulaDao = AulaDao(appDatabase);
  final saudacao = SaudacaoDao(appDatabase);

  try {
    await aulaDao.loadInitialData();
  } catch (e) {
    debugPrint(e.toString());
  }
  try {
    await saudacao.loadInitialData();
  } catch (e) {
    debugPrint(e.toString());
  }

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
        Provider<SaudacaoDao>(create: (_) => saudacao),
        Provider<SaudacaoRepository>(
          create:
              (context) => SaudacaoRepositoryImpl(context.read<SaudacaoDao>()),
        ),
        ChangeNotifierProvider(
          create: (context) => UserViewModel(context.read<UserRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => ScoreViewModel(context.read<ScoreRepository>()),
        ),
        ChangeNotifierProvider(
          create:
              (context) =>
                  ClassContentViewModel(context.read<SaudacaoRepository>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
