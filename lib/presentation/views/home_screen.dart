import 'package:flutter/material.dart';
import 'package:libras/presentation/viewmodels/aulas_viewmodel.dart';
import 'package:libras/presentation/viewmodels/materials_viewmodel.dart';
import 'package:libras/presentation/viewmodels/score_viewmodel.dart';
import 'package:libras/presentation/viewmodels/user_viewmodel.dart';
import 'package:libras/presentation/views/materials_screen.dart';
import 'package:libras/presentation/widgets/app_greeting_widget.dart';
import 'package:libras/presentation/widgets/aula_card_widget.dart';
import 'package:libras/presentation/widgets/aulas_container_widget.dart';
// import 'package:libras/presentation/widgets/exercise_widget.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AulasViewModel>().loadAulas();
    });
    print('initState');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  int widgetsController = 0;

  @override
  Widget build(BuildContext context) {
    // final aulas = context.watch<AulasViewModel>().aulas;
    final aulas = Provider.of<AulasViewModel>(context, listen: true).aulas;
    final viewModel = context.watch<UserViewModel>();
    final scoreViewModel = context.watch<ScoreViewModel>();
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
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
              // SizedBox(height: 20),
              AulasContainerWidget(
                // containerHeight: 150,
                children: List.generate(
                  context.watch<AulasViewModel>().aulas.length,
                  (index) {
                    late double containerWidth;
                    widgetsController == 2
                        ? containerWidth =
                            MediaQuery.of(context).size.width * 0.92
                        : containerWidth =
                            MediaQuery.of(context).size.width * 0.45;
                    widgetsController == 2
                        ? widgetsController = 0
                        : widgetsController++;
                    return AulaCardWidget(
                      // fadeColor: Theme.of(context).colorScheme.onPrimary,
                      containerWidth: containerWidth,
                      // onTap: () => _aulaAbc(context),
                      onTap: () async {
                        context.read<AulasViewModel>().onClickAula(
                          aulas[index],
                        );
                        context
                            .read<MaterialsViewModel>()
                            .loadMaterialsByAulaId(
                              aulas[index].id,
                              aulas[index].step,
                            );

                        if (!mounted) return;
                        Navigator.pushNamed(context, MaterialsScreen.id);
                      },
                      // imageLink: aulas[index].imageLink,
                      // imageHeight: 100,
                      imageWidth: 200,
                      text: aulas[index].name,
                      fadeColor:
                          context.watch<AulasViewModel>().aulas[index].isStart
                              ? Theme.of(context).colorScheme.onSecondary
                              : Theme.of(context).colorScheme.onPrimary,
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
