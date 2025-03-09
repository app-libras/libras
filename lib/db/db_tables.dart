class UserDbTables {
  String get user => 'user';
  String get userTables => '''
  CREATE TABLE $user (
    _id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
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
