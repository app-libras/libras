import 'package:libras/core/database/dao/user_dao.dart';
import 'package:libras/data/models/user_model.dart';
import 'package:libras/data/repositories/repo/user_repository.dart';
import 'package:libras/domain/entities/user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDao _userDao;

  UserRepositoryImpl(this._userDao);

  @override
  Future<List<User>> getUser() async {
    final result = await _userDao.getAllUsers();
    return List<User>.from(result.map((e) => UserModel.fromMap(e).toEntity()));
  }

  @override
  Future<void> addUser(UserModel user) async {
    await _userDao.insertUser(user.toMap());
  }
}
