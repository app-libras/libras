import 'package:libras/core/constants/database_tables_name_constants.dart';

class UserTables {
  final String user = DatabaseTablesName.user;
  String get userTables => '''
  CREATE TABLE $user (
    id INTEGER PRIMARY KEY CHECK (id == 1) UNIQUE DEFAULT 1,
    name TEXT NOT NULL UNIQUE,
    profile_pic TEXT
  )''';
}

class ScoreTables {
  final String score = DatabaseTablesName.score;
  String get scoreTables => '''
  CREATE TABLE $score (
    id INTEGER PRIMARY KEY CHECK (id == 1) UNIQUE DEFAULT 1,
    points INTEGER NOT NULL DEFAULT 0,
    level INTEGER NOT NULL DEFAULT 1,
    user_id INTEGER NOT NULL,
    FOREIGN KEY(user_id) REFERENCES ${DatabaseTablesName.user}(_id) ON DELETE CASCADE
  )''';
}

class AulaTables {
  final String aula = DatabaseTablesName.aula;
  String get aulaTables => '''
  CREATE TABLE $aula (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    is_start INTEGER NOT NULL,
    is_finish INTEGER NOT NULL,
    step INTEGER NOT NULL
  )''';
}

class MateriaTables {
  final String materia = DatabaseTablesName.material;
  String get materiaTables => '''
  CREATE TABLE $materia (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    path TEXT NOT NULL,
    is_questions INTEGER NOT NULL,
    is_answer INTEGER NOT NULL,
    aula_id INTEGER NOT NULL,
    FOREIGN KEY(aula_id) REFERENCES ${DatabaseTablesName.aula}(_id) ON DELETE CASCADE
  )''';
}

class SaudacoesTables {
  final String saudacoes = DatabaseTablesName.saudacoes;
  String get saudacoesTables => '''
  CREATE TABLE $saudacoes (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    path TEXT NOT NULL,
    aula_id INTEGER NOT NULL,
    FOREIGN KEY(aula_id) REFERENCES ${DatabaseTablesName.aula}(_id) ON DELETE CASCADE
  )''';
}
