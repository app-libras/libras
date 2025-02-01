// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:libras/providers/user_provider.dart';
import 'package:libras/widgets/app_greeting.dart';
import 'package:libras/widgets/aula_card_widget.dart';
import 'package:libras/widgets/aulas_container_widget.dart';
import 'package:libras/widgets/exercise_widget.dart';
// import 'package:libras/widgets/progressive_circle.dart';
import 'package:libras/widgets/score_widget.dart';
import 'package:libras/widgets/scores_container_widget.dart';
import 'package:provider/provider.dart';
import 'package:libras/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = 'home_screen';

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

void _aulaAbc(BuildContext context) {
  Navigator.pushNamed(context, 'aula_screen');
}

void _userprofiler(BuildContext context) {
  Navigator.pushNamed(context, ProfileScreen.id);
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppGreeting(
              name: 'Prince',
              fontSize: 20,
              profileImage: 'assets/images/sign.png',
              textColor: Theme.of(context).colorScheme.primary,
              onTap: () => _userprofiler(context),
            ),
            ScoresContainerWidget(
              height: 120,
              borderRadius: BorderRadius.circular(20),
              decorationColor: Theme.of(context).colorScheme.onSecondary,
              children: <Widget>[
                ScoreWidget(
                  text: 'Pontos',
                  points: 1,
                  imageLink: 'assets/images/ponto.png',
                  imageSize: 50,
                  borderRadius: BorderRadius.circular(20),
                  decorationColor: Theme.of(context).colorScheme.surface,
                ),
                ScoreWidget(
                  text: 'Nivel',
                  points: 23,
                  imageLink: 'assets/images/level.png',
                  imageSize: 50,
                  borderRadius: BorderRadius.circular(20),
                  decorationColor: Theme.of(context).colorScheme.surface,
                ),
              ],
            ),
            AulasContainerWidget(
              containerHeight: 100,
              children: <Widget>[
                AulaCardWidget(
                  onTap: () => _aulaAbc(context),
                  imageLink: 'assets/aulas/abc_gif/logo/abc.png',
                  // imageHeight: 100,
                  imageWidth: 200,
                  text: 'Aula 1',
                  fadeColor: Theme.of(context).colorScheme.onPrimary,
                ),
                AulaCardWidget(
                  onTap: () => _aulaAbc(context),
                  imageLink: 'assets/aulas/abc_gif/logo/abc.png',
                  // imageHeight: 100,
                  imageWidth: 200,
                  text: 'Aula 2',
                  fadeColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ],
            ),
            SizedBox(height: 20),
            // ExcerciseWidget(

            ExerciseWidget(
              onTap: () => _aulaAbc(context),
              imageLink: 'assets/aulas/abc_gif/logo/abc.png',
              text: 'Exercicio 1',
              fadeColor: Theme.of(context).colorScheme.onPrimary,
            ),

            SizedBox(height: 20),
            AulasContainerWidget(
              containerHeight: 100,
              children: <Widget>[
                AulaCardWidget(
                  onTap: () => _aulaAbc(context),
                  imageLink: 'assets/aulas/abc_gif/logo/abc.png',
                  // imageHeight: 100,
                  imageWidth: 200,
                  text: 'Aula 3',
                  fadeColor: Theme.of(context).colorScheme.onPrimary,
                ),
                AulaCardWidget(
                  onTap: () => _aulaAbc(context),
                  imageLink: 'assets/aulas/abc_gif/logo/abc.png',
                  // imageHeight: 100,
                  imageWidth: 200,
                  text: 'Aula 4',
                  fadeColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ],
            ),
            SizedBox(height: 20),
            // ExcerciseWidget(

            ExerciseWidget(
              onTap: () => _aulaAbc(context),
              imageLink: 'assets/aulas/abc_gif/logo/abc.png',
              text: 'Exercicio 2',
              fadeColor: Theme.of(context).colorScheme.onPrimary,
            ),

            SizedBox(height: 500),
          ],
        ),
      ),
    );
  }
}
