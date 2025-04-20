import 'package:flutter/material.dart';
import 'package:libras/presentation/viewmodels/score_viewmodel.dart';
import 'package:libras/presentation/views/home_screen.dart';
import 'package:libras/presentation/viewmodels/user_viewmodel.dart';
import 'package:libras/presentation/widgets/loading_widget.dart';
import 'package:libras/presentation/widgets/user_name_widget.dart';
import 'package:provider/provider.dart';

class LoadUserScreen extends StatefulWidget {
  const LoadUserScreen({super.key});
  static const id = 'load_user_screen';

  @override
  State<LoadUserScreen> createState() => _LoadUserScreenState();
}

class _LoadUserScreenState extends State<LoadUserScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUser();
    _loadScore();
  }

  void _loadUser() async {
    await Provider.of<UserViewModel>(context, listen: false).loadUsers();
  }

  void _loadScore() async {
    await Provider.of<ScoreViewModel>(context, listen: false).loadScore();
  }

  void _initUserScore(int userId, int points, int level) async {
    await Provider.of<ScoreViewModel>(
      context,
      listen: false,
    ).addScore(userId, level, points);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    final scoreViewModel = Provider.of<ScoreViewModel>(context);

    if (userViewModel.isUser) {
      userViewModel.showLoading();
      if (!scoreViewModel.isScore) {
        _initUserScore(userViewModel.user[0].id, 1, 0);
      }
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, HomeScreen.id);
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      // body: LoadingWidget(),
      body:
          userViewModel.isLoading
              ? const LoadingWidget()
              : UserNameWidget(
                nameController: _nameController,
                onEnter: () async {
                  if (_nameController.text.isEmpty) return;
                  await userViewModel.addUser(_nameController.text);
                  _nameController.clear();
                },
              ),
    );
  }
}
