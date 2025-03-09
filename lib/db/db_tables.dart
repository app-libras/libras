class UserDbTables {
  String get user => 'user';
  String get userTables => '''
  CREATE TABLE $user (
    _id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    profile_pic TEXT
  )''';
}

class ScoreDbTables {
  String get score => 'score';
  String get scoreTables => '''
  CREATE TABLE $score (
    _id INTEGER PRIMARY KEY AUTOINCREMENT,
    score INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY(user_id) REFERENCES user(_id)
  )''';
}

class AulaDbTables {
  String get aula => 'aula';
  String get aulaTables => '''
  CREATE TABLE $aula (
    _id INTEGER PRIMARY KEY AUTOINCREMENT,
    aula INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY(user_id) REFERENCES user(_id)
  )''';
}

class MateriaDbTables {
  String get materia => 'materia';
  String get materiaTables => '''
  CREATE TABLE $materia (
    _id INTEGER PRIMARY KEY AUTOINCREMENT,
    materia INTEGER NOT NULL,
    path TEXT NOT NULL,
    aula_id INTEGER NOT NULL,
    FOREIGN KEY(aula_id) REFERENCES aula(_id)
  )''';
}

class QuestionDbTables {
  String get question => 'question';
  String get questionTables => '''
  CREATE TABLE $question (
    _id INTEGER PRIMARY KEY AUTOINCREMENT,
    question INTEGER NOT NULL,
    path TEXT NOT NULL,
    aula_id INTEGER NOT NULL,
    FOREIGN KEY(aula_id) REFERENCES aula(_id)
  )''';
}