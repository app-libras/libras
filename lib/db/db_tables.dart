class DbTables {
  String get user => 'user';
  String get userTables =>'''
  CREATE TABLE user (
    _id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
  )''';
}