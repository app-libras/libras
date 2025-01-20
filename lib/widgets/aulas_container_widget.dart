import 'package:flutter/material.dart';

class AulasContainerWidget extends StatelessWidget {
  final List<Widget> children;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final MainAxisAlignment? mainAxisAlignment;

  const AulasContainerWidget({
    super.key,
    required this.children,
    this.height,
    this.width,
    this.margin,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ??
          const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
      // decoration: BoxDecoration(
      //   // color: Theme.of(context).colorScheme.onSecondary,
      //   borderRadius: BorderRadius.circular(30),
      // ),
      width: width ?? double.infinity,
      height: height ?? 200,
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}
