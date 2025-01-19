import 'package:flutter/material.dart';
import 'package:libras/configs/themes.dart';
import 'package:libras/screens/aula.dart';
import 'package:libras/screens/get_user_name.dart';
import 'package:libras/screens/home.dart';
import 'package:libras/screens/profile.dart';
import 'package:libras/screens/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Librar',
      theme: myTheme(),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        UserNameScreen.id: (context) => const UserNameScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        AulaScreen.id: (context) => const AulaScreen(),
        ProfileScreen.id: (context) => const ProfileScreen(),
      },
    );
  }
}
