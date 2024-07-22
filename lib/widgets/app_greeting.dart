import 'package:flutter/material.dart';

class AppGreeting extends StatelessWidget {
  final String text;
  final Color textColor;
  final double? fontSize;

  const AppGreeting({
    super.key,
    required this.text,
    required this.textColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        left: 20,
        bottom: 10,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 30,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
