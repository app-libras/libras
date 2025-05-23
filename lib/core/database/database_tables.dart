import 'package:libras/core/constants/database_tables_name_constants.dart';

class UserTables {
  final String user = DatabaseTablesName.user;
  String get userTables => '''
  CREATE TABLE $user (
    _id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    profile_pic TEXT
  )''';
}

class ScoreTables {
  final String score = DatabaseTablesName.score;
  String get scoreTables => '''
  CREATE TABLE $score (
    _id INTEGER PRIMARY KEY AUTOINCREMENT,
    points INTEGER NOT NULL,
    level INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY(user_id) REFERENCES ${DatabaseTablesName.user}(_id) ON DELETE CASCADE
  )''';
}

class AulaTables {
  final String aula = DatabaseTablesName.aula;
  String get aulaTables => '''
  CREATE TABLE $aula (
    _id INTEGER PRIMARY KEY AUTOINCREMENT,
    aula INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY(user_id) REFERENCES ${DatabaseTablesName.user}(_id) ON DELETE CASCADE
  )''';
}

class MateriaTables {
  final String materia = DatabaseTablesName.materia;
  String get materiaTables => '''
  CREATE TABLE $materia (
    _id INTEGER PRIMARY KEY AUTOINCREMENT,
    materia INTEGER NOT NULL,
    path TEXT NOT NULL,
    aula_id INTEGER NOT NULL,
    FOREIGN KEY(aula_id) REFERENCES ${DatabaseTablesName.aula}(_id) ON DELETE CASCADE
  )''';
}

class QuestionTables {
  final String question = DatabaseTablesName.question;
  String get questionTables => '''
  CREATE TABLE $question (
    _id INTEGER PRIMARY KEY AUTOINCREMENT,
    question INTEGER NOT NULL,
    path TEXT NOT NULL,
    aula_id INTEGER NOT NULL,
    FOREIGN KEY(aula_id) REFERENCES ${DatabaseTablesName.aula}(_id) ON DELETE CASCADE
  )''';
}
