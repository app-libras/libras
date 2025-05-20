import 'package:flutter/material.dart';
import 'package:libras/presentation/viewmodels/class_content_viewmodel.dart';
import 'package:libras/presentation/viewmodels/score_viewmodel.dart';
import 'package:libras/presentation/viewmodels/user_viewmodel.dart';
import 'package:libras/presentation/views/class_content_screen.dart';
import 'package:libras/presentation/widgets/app_greeting_widget.dart';
import 'package:libras/presentation/widgets/aula_card_widget.dart';
import 'package:libras/presentation/widgets/aulas_container_widget.dart';
import 'package:libras/presentation/widgets/exercise_widget.dart';
import 'package:libras/presentation/widgets/score_widget.dart';
import 'package:libras/presentation/widgets/scores_container_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // void _clickAula() async {
  //   await

  //   Navigator.pushNamed(context, ClassContentScreen.id);
  // }

  @override
  Widget build(BuildContext context) {
    final classContentViewModel = context.read<ClassContentViewModel>();
    final viewModel = context.watch<UserViewModel>();
    final scoreViewModel = context.watch<ScoreViewModel>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppGreetingWidget(
              name: viewModel.user[0].name,
              fontSize: 30,
              profileImage: viewModel.user[0].profilePic,
              textColor: Theme.of(context).colorScheme.primary,
              onTap: () => () {},
            ),
            ScoresContainerWidget(
              height: 150,
              borderRadius: BorderRadius.circular(20),
              decorationColor: Theme.of(context).colorScheme.onSecondary,
              children: <Widget>[
                ScoreWidget(
                  text: 'Pontos',
                  points: scoreViewModel.score[0].points,
                  imageLink: 'assets/logos/ponto.png',
                  imageSize: 50,
                  borderRadius: BorderRadius.circular(20),
                  decorationColor: Theme.of(context).colorScheme.surface,
                ),
                ScoreWidget(
                  text: 'Nível',
                  points: scoreViewModel.score[0].level,
                  imageLink: 'assets/logos/level.png',
                  imageSize: 50,
                  borderRadius: BorderRadius.circular(20),
                  decorationColor: Theme.of(context).colorScheme.surface,
                ),
              ],
            ),
            SizedBox(height: 20),
            AulasContainerWidget(
              containerHeight: 150,
              children: <Widget>[
                AulaCardWidget(
                  containerWidth: MediaQuery.of(context).size.width * 0.45,
                  // onTap: () => _aulaAbc(context),
                  onTap:
                      () => {
                        classContentViewModel.loadSaudacoes(),
                        Navigator.pushNamed(context, ClassContentScreen.id),
                      },
                  imageLink: 'assets/aulas/abc/abc.png',
                  // imageHeight: 100,
                  imageWidth: 200,
                  text: 'Saudações',
                  fadeColor: Theme.of(context).colorScheme.onPrimary,
                ),
                AulaCardWidget(
                  containerWidth: MediaQuery.of(context).size.width * 0.45,
                  // onTap: () => _aulaAbc(context),
                  onTap: () {},
                  imageLink: 'assets/aulas/abc/abc.png',
                  // imageHeight: 100,
                  imageWidth: 200,
                  text: 'Aula 2',
                  fadeColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ],
            ),
            SizedBox(height: 20),
            ExerciseWidget(
              onTap: () => {},
              imageLink: 'assets/aulas/abc/abc.png',
              text: 'Exercicio 1',
              fadeColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
