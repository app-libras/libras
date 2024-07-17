import 'package:flutter/material.dart' show runApp;

import 'package:libras/app/my_app.dart';

/// The entry point of the application.
///
/// This function is called when the app is launched and sets up the root of the
/// application widget tree.
///
/// The `main` function is where the app starts, and it is similar to the `main`
/// function in other programming languages. It is the starting point of the
/// application.
///
/// The `runApp` function takes the widget that represents the root of the
/// application widget tree and runs the app. In this case, the root widget is
/// an instance of the `MyApp` widget.
void main() {
  // Run the app by passing the root widget.
  runApp(const MyApp());
}
