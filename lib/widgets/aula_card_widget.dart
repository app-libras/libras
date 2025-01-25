import 'package:flutter/material.dart';

class AulaCardWidget extends StatelessWidget {
  const AulaCardWidget({
    super.key,
    required this.imageLink,
    required this.text,
    this.fadeColor,
    this.imageWidth,
    this.imageHeight,
  });

  final String imageLink;
  final double? imageHeight;
  final double? imageWidth;
  final Color? fadeColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(30),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            imageLink,
            height: imageHeight ?? double.infinity,
            width: imageWidth ?? double.infinity,
            fit: BoxFit.fitWidth,
            // scale: 0.01,
          ),
          Container(
            decoration: BoxDecoration(
              color: fadeColor ?? Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
