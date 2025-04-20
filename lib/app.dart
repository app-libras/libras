import 'package:flutter/material.dart';
import 'package:libras/core/themes/light_themes.dart';
import 'package:libras/presentation/views/home_screen.dart';
import 'package:libras/presentation/views/load_user_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Libras',
      theme: lightTheme(),
      initialRoute: LoadUserScreen.id,
      routes: {
        LoadUserScreen.id: (context) => const LoadUserScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
      },
    );
  }
}
