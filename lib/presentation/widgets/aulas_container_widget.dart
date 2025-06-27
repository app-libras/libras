import 'package:flutter/material.dart';

class AulasContainerWidget extends StatelessWidget {
  final List<Widget> children;
  final double? containerHeight;
  final double? containerWidth;
  final EdgeInsetsGeometry? containerMargin;
  final MainAxisAlignment? mainAxisAlignment;

  const AulasContainerWidget({
    super.key,
    required this.children,
    this.containerHeight,
    this.containerWidth,
    this.containerMargin,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      // mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}
