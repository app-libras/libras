import 'package:flutter/material.dart';
import 'package:librar/presentation/widgets/stack_widget.dart';

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
      child: Hero(
        tag: text,
        child: Container(
          width: containerWidth ?? 150,
          height: containerHeight ?? 150,
          decoration: BoxDecoration(
            color: fadeColor ?? Theme.of(context).colorScheme.secondary,
            borderRadius: borderRadius ?? BorderRadius.circular(20),

            border: Border.all(color: Colors.white, width: 2),
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
      ),
    );
  }
}
