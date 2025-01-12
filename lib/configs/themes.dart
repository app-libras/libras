import 'package:flutter/material.dart';

ThemeData myTheme() {
  return ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light().copyWith(
      primary: const Color(0xffF5F7F8),
      secondary: const Color(0xff399918),
      tertiary: const Color.fromARGB(61, 208, 231, 200),
      surface: const Color(0xffEFFFFB),
      onSurface: const Color.fromARGB(255, 222, 228, 225),
      onSecondary: const Color.fromARGB(255, 2, 97, 45),
      onTertiary: const Color.fromARGB(255, 2, 97, 45),
      onPrimary: const Color.fromARGB(255, 4, 245, 149),
      error: const Color.fromARGB(220, 185, 55, 55),
      onError: const Color.fromARGB(218, 192, 50, 40),
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
    // // iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff379777),
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
    //     // backgroundColor: Color.fromARGB(255, 2, 97, 45),
    //     ),

    // // elevatedButtonTheme: ElevatedButtonThemeData(
    // //   style: ButtonStyle(
    // //     backgroundColor: WidgetStateProperty.all<Color>(
    // //       const Color.fromARGB(255, 4, 245, 149),
    // //     ),
    // //     foregroundColor: WidgetStateProperty.all<Color>(
    // //       const Color.fromARGB(255, 2, 97, 45),
    // //     ),
    // //   ),
    // // ),
    // // textButtonTheme: TextButtonThemeData(
    // //   style: ButtonStyle(
    // //     foregroundColor: WidgetStateProperty.all<Color>(
    // //       const Color.fromARGB(255, 4, 245, 149),
    // //     ),
    // //   ),
    // // ),
    // // textSelectionTheme: const TextSelectionThemeData(
    // //   cursorColor: Color.fromARGB(255, 4, 245, 149),
    // // ),
  );
}
