import 'package:flutter/material.dart';
import 'package:libras/presentation/widgets/stack_widget.dart';

class AulaCardWidget extends StatelessWidget {
  const AulaCardWidget({
    super.key,
    // required this.imageLink,
    required this.text,
    required this.onTap,
    this.fadeColor,
    this.imageWidth,
    this.imageHeight,
    this.containerHeight,
    this.containerWidth,
    this.borderRadius,
  });

  // final String imageLink;
  final String text;
  final void Function() onTap;
  final double? imageHeight;
  final double? imageWidth;
  final Color? fadeColor;
  final double? containerHeight;
  final double? containerWidth;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: containerWidth ?? 150,
        height: containerHeight ?? 150,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: borderRadius ?? BorderRadius.circular(20),
        ),
        clipBehavior: Clip.hardEdge,
        child: StackWidget(
          // imageLink: imageLink,
          imageHeight: imageHeight,
          imageWidth: imageWidth,
          fadeColor: fadeColor,
          text: text,
        ),
      ),
    );
  }
}
