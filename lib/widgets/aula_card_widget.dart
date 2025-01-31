import 'package:flutter/material.dart';

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
      ),
    );
  }
}
