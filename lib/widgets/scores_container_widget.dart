import 'package:flutter/material.dart';

class ScoresContainerWidget extends StatelessWidget {
  final List<Widget> children;
  final Color? decorationColor;
  final BorderRadius? borderRadius;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? height;
  final double? width;
  final EdgeInsets? margin;

  const ScoresContainerWidget({
    super.key,
    required this.children,
    this.decorationColor,
    this.borderRadius,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.height,
    this.width,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 200,
      margin: margin ??
          const EdgeInsets.only(
            top: 25,
            bottom: 20,
            left: 10,
            right: 10,
          ),
      decoration: BoxDecoration(
        color: decorationColor ?? Theme.of(context).colorScheme.onSecondary,
        borderRadius: borderRadius ?? BorderRadius.circular(15),
      ),
      // color: Theme.of(context).colorScheme.secondary,
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
