import 'package:flutter/material.dart';

AppBar myAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    // backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () => Navigator.pop(context),
    ),
  );
}
