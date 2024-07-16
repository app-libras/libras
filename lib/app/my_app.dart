import 'package:flutter/material.dart';
import 'package:libras/configs/themes.dart';
import 'package:libras/screens/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme(),
      home: const Splash(),
    );
  }
}
