import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:libras/screens/get_user_name.dart';
import 'package:libras/screens/home.dart';
import 'package:libras/auth/verifiy_user_account.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var isUser = false;

  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    isUser = await VerifiyUserAccount().getUser();

    await Future.delayed(const Duration(seconds: 2), () {
      _getUser();
    });
  }

  void _getUser() {
    try {
      if (isUser) {
        Navigator.pushReplacementNamed(context, HomeScreen.id);
      } else {
        Navigator.pushReplacementNamed(context, UserNameScreen.id);
      }
    } catch (e) {
      Navigator.pushReplacementNamed(context, UserNameScreen.id);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: <Widget>[
                    AnimatedTextKit(
                      repeatForever: true,
                      pause: const Duration(milliseconds: 5000),
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'LiBRAR',
                          textStyle: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/images/sign.png',
                  height: 100,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
