import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.blueGrey,
    colorScheme: const ColorScheme.light().copyWith(
      primary: const Color.fromARGB(255, 23, 24, 24),
      secondary: const Color(0xFFF0FEF0),
      tertiary: const Color(0xFF70DE70),
      surface: const Color(0xff70DE70),
      onSurface: const Color.fromARGB(255, 222, 228, 225),
      onSecondary: const Color(0xFFC5F8C5),
      onTertiary: const Color.fromARGB(255, 2, 97, 45),
      onPrimary: const Color.fromARGB(58, 5, 5, 5),

      error: const Color.fromARGB(220, 185, 55, 55),
      onError: const Color.fromARGB(41, 248, 30, 30),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black),
      titleSmall: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.black),
      bodyLarge: TextStyle(color: Colors.black),
      labelLarge: TextStyle(color: Colors.black),
      labelMedium: TextStyle(color: Colors.black),
      labelSmall: TextStyle(color: Colors.black),
    ),
    // iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xffF1FDF3),
      foregroundColor: Color(0xffF5F7F8),
      elevation: 0,
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        // color: Color(0xffF5F7F8),
        size: 20,
      ),
    ),
    scaffoldBackgroundColor: const Color(0xffF5F7F8),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  );
}

// colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// useMaterial3: true,
