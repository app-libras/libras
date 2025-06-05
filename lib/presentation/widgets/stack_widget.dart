import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({
    super.key,
    // required this.imageLink,
    required this.imageHeight,
    required this.imageWidth,
    required this.fadeColor,
    required this.text,
  });

  // final String imageLink;
  final double? imageHeight;
  final double? imageWidth;
  final Color? fadeColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Image.asset(
        //   imageLink,
        //   height: imageHeight ?? double.infinity,
        //   width: imageWidth ?? double.infinity,
        //   // fit: BoxFit.fitWidth,
        //   // scale: 1,
        // ),
        Container(
          decoration: BoxDecoration(
            color: fadeColor ?? Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            // color: Colors.white,
          ),
        ),
      ],
    );
  }
}
