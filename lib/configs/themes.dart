import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(),
  );
}

ThemeData myTheme() {
  return ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.light().copyWith(
      primary: const Color.fromARGB(255, 4, 245, 149),
      secondary: const Color.fromARGB(255, 4, 245, 149),
      // tertiary: const Color.fromARGB(255, 4, 245, 149),
      surface: const Color.fromARGB(255, 2, 97, 45),
      // onSurface: const Color.fromARGB(255, 2, 97, 45),
      // onSecondary: const Color.fromARGB(255, 2, 97, 45),
      // onTertiary: const Color.fromARGB(255, 2, 97, 45),
      // onPrimary: const Color.fromARGB(255, 4, 245, 149),
      // error: const Color.fromARGB(255, 4, 245, 149),
      // onError: const Color.fromARGB(255, 4, 245, 149),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
      displayLarge: TextStyle(color: Colors.white),
      displayMedium: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
      labelLarge: TextStyle(color: Colors.white),
      labelMedium: TextStyle(color: Colors.white),
      labelSmall: TextStyle(color: Colors.white),
      headlineLarge: TextStyle(color: Colors.white),
      headlineMedium: TextStyle(color: Colors.white),
      headlineSmall: TextStyle(color: Colors.white),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme:
        const AppBarTheme(backgroundColor: Color.fromARGB(255, 56, 18, 18)),
    scaffoldBackgroundColor: const Color.fromARGB(255, 2, 97, 45),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 2, 97, 45),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          const Color.fromARGB(255, 4, 245, 149),
        ),
        foregroundColor: WidgetStateProperty.all<Color>(
          const Color.fromARGB(255, 2, 97, 45),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(
          const Color.fromARGB(255, 4, 245, 149),
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color.fromARGB(255, 4, 245, 149),
    ),
  );
}
