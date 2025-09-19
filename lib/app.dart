import 'package:flutter/material.dart';
import 'package:librar/core/themes/light_themes.dart';
import 'package:librar/presentation/views/atividade_screen.dart';
import 'package:librar/presentation/views/materials_screen.dart';
import 'package:librar/presentation/views/home_screen.dart';
import 'package:librar/presentation/views/load_user_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Librar',
      theme: lightTheme(),
      initialRoute: LoadUserScreen.id,
      routes: {
        LoadUserScreen.id: (context) => const LoadUserScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        MaterialsScreen.id: (context) => const MaterialsScreen(),
        AtividadeScreen.id: (context) => const AtividadeScreen(),
      },
    );
  }
}
