import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:libras/models/user_database.dart';
import 'package:libras/screens/get_user_name.dart';
import 'package:libras/screens/home.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const id = 'splash_screen';

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // _readUser();
    _navigatetohome();
  }

  // void _readUser() {
  //   try {
  //     context.read<UserDatabase>().getUser();
  //     // ignore: empty_catches
  //   } catch (e) {}
  // }

  _navigatetohome() async {

    await Future.delayed(const Duration(seconds: 2), () {
    Navigator.pushReplacementNamed(context, HomeScreen.id); 
    //   _getUser();
    });
  }

  void _getUser() {
    // final userDatabase = context.read<UserDatabase>();
    // try {
    //   if (userDatabase.user.name != null) {
    //     Navigator.pushReplacementNamed(context, HomeScreen.id);
    //   } else {
    //     Navigator.pushReplacementNamed(context, UserNameScreen.id);
    //   }
    // } catch (e) {
    //   Navigator.pushReplacementNamed(context, UserNameScreen.id);
    // }
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
