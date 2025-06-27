import 'package:flutter/material.dart';
import 'package:libras/data/models/user_model.dart';
import 'package:libras/data/repositories/repo/user_repository.dart';
import 'package:libras/domain/entities/user.dart';

class UserViewModel with ChangeNotifier {
  final UserRepository _userRepository;

  List<User> _user = [];
  bool _isLoading = false;

  List<User> get user => _user;
  bool get isUser => _user.isNotEmpty;
  bool get isLoading => _isLoading;

  UserViewModel(this._userRepository);

  Future<void> loadUsers() async {
    _isLoading = true;

    try {
      _user = await _userRepository.getUser();
    } catch (e) {
      // showLoading();
      debugPrint(e.toString());
    } finally {
      _isLoading = false;
    }
    notifyListeners();
  }

  Future<void> addUser(String name) async {
    // print(name);
    final user = UserModel(
      id: 1,
      name: name,
      profilePic: 'assets/profiles/profile_default.png',
    );
    await _userRepository.addUser(user);
    await loadUsers();
  }

  void showLoading() {
    _isLoading = true;
    // notifyListeners();
  }
}
