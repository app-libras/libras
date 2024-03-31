import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:libras/telas/usuario_primario_acceso.dart';
import 'package:libras/telas/circles.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CirclesScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 97, 45),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: <Widget>[
                    const Text(
                      'Bem Vindo ao',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    AnimatedTextKit(
                      repeatForever: true,
                      pause: const Duration(milliseconds: 5000),
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'LiBRAR',
                          textStyle: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
