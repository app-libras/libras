import 'package:isar/isar.dart';

// this line is needed to generate file
// flutter pub run build_runner build
part 'user.g.dart';

@Collection()
class User {
  Id id = Isar.autoIncrement;
  late String? name;
  late int avatar = 2;
  late int score = 0;
  late int level = 1;
}

// this line is needed to generate file
// flutter pub run build_runner build

