import 'package:flutter/material.dart';
import 'package:libras/widgets/stack_widget.dart';

class AulaCardWidget extends StatelessWidget {
  const AulaCardWidget({
    super.key,
    required this.imageLink,
    required this.text,
    required this.onTap,
    this.fadeColor,
    this.imageWidth,
    this.imageHeight,
  });

  final String imageLink;
  final String text;
  final void Function() onTap;
  final double? imageHeight;
  final double? imageWidth;
  final Color? fadeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 190,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.hardEdge,
        child: StackWidget(
          imageLink: imageLink,
          imageHeight: imageHeight,
          imageWidth: imageWidth,
          fadeColor: fadeColor,
          text: text,
        ),
      ),
    );
  }
}
