
import 'package:libras/data/models/user_model.dart';
abstract class UserRepository{
  Future<UserModel> getUser();
  Future<void> addUser(UserModel user);
}