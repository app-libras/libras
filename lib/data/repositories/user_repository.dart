import 'package:libras/data/models/user_model.dart';
import 'package:libras/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUser();
  Future<void> addUser(UserModel user);
}
