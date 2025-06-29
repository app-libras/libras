import 'package:librar/data/models/user_model.dart';
import 'package:librar/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUser();
  Future<void> addUser(UserModel user);
}
