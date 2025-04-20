import 'package:flutter/material.dart';
import 'package:libras/presentation/widgets/stack_widget.dart';

class ExerciseWidget extends StatelessWidget {
  final String imageLink;
  final String text;
  final void Function() onTap;
  final double? imageHeight;
  final double? imageWidth;
  final Color? fadeColor;

  const ExerciseWidget({
    super.key,
    required this.imageLink,
    required this.text,
    required this.onTap,
    this.imageHeight,
    this.imageWidth,
    this.fadeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 120,
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
      ),
    );
  }
}
