import 'package:flutter/material.dart';
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
  }

  void _loadUser() async {
    await Provider.of<UserViewModel>(context, listen: false).loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UserViewModel>(context);

    if (viewModel.isUser) {
      viewModel.showLoading();
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, HomeScreen.id);
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      // body: LoadingWidget(),
      body:
          viewModel.isLoading
              ? const LoadingWidget()
              : UserNameWidget(
                nameController: _nameController,
                onEnter: () async {
                  await viewModel.addUser(_nameController.text);
                  _nameController.clear();
                },
              ),
    );
  }
}
