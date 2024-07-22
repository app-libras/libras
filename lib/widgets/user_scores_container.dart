import 'package:flutter/material.dart';

class UserScoresContainer extends StatelessWidget {
  final List<Widget> children;
  final Color? decorationColor;
  final BorderRadius? borderRadius;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  const UserScoresContainer({
    super.key,
    required this.children,
    this.decorationColor,
    this.borderRadius,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      margin: const EdgeInsets.only(
        bottom: 20,
        top: 20,
      ),
      decoration: BoxDecoration(
        color: decorationColor ?? Theme.of(context).colorScheme.tertiary,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
      // color: Theme.of(context).colorScheme.secondary,
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
