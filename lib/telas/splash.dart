import 'package:flutter/material.dart';
import 'package:libras/telas/usuario_primario_acceso.dart';

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
    // await Future.delayed(const Duration(seconds: 10), () {});
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => const UsuarioAcceso()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Column(
                  children: <Widget>[
                    Text(
                      'Bem Vindo ao',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' LIBRAR.',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
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
