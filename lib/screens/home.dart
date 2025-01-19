// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:libras/providers/user_provider.dart';
import 'package:libras/widgets/app_greeting.dart';
import 'package:libras/widgets/progressive_circle.dart';
import 'package:libras/widgets/user_score.dart';
import 'package:libras/widgets/user_scores_container.dart';
import 'package:provider/provider.dart';
import 'package:libras/screens/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

_aulaAbc(BuildContext context) {
  Navigator.pushNamed(context, 'aula_screen');

  _userprofiler(BuildContext context){
    Navigator.pushNamed(context, 'profile_screen');
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      bottomNavigationBar: BottomAppBar(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.home,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
                const Text('Home'),
              ],
            ),
            IconButton(
              icon: const Icon(
                Icons.person,
                size: 30,
              ),
              onPressed: _userprofiler,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppGreeting(
              text: 'Bem Vindo ao Librar',
              textColor: Theme.of(context).colorScheme.primary,
              fontSize: 25,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    const UserScoresContainer(
                      children: <Widget>[
                        UserScore(
                          text: 'Pontos',
                          points: 1,
                          imageLink: 'assets/images/ponto.png',
                        ),
                        UserScore(
                          text: 'Nivel',
                          points: 23,
                          imageLink: 'assets/images/level.png',
                        ),
                      ],
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ProgressiveCircle(
                            text: "ABC",
                            textColor: Theme.of(context).colorScheme.secondary,
                            backgroundColor: Colors.greenAccent,
                            progressColor:
                                Theme.of(context).colorScheme.secondary,
                            percent: .5,
                            onTap: () => _aulaAbc(context),
                          ),
                          ProgressiveCircle(
                            text: "123",
                            textColor: Theme.of(context).colorScheme.secondary,
                            backgroundColor: Colors.greenAccent,
                            progressColor:
                                Theme.of(context).colorScheme.secondary,
                            percent: 0.0,
                            onTap: () {
                              print("0%");
                            },
                          ),
                          ProgressiveCircle(
                            text: "SAUDAÇÕES",
                            textColor: Theme.of(context).colorScheme.secondary,
                            backgroundColor: Colors.greenAccent,
                            progressColor:
                                Theme.of(context).colorScheme.secondary,
                            percent: 0.0,
                            onTap: () {
                              print("0%");
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
