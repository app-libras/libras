import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressiveCircle extends StatelessWidget {
  final Color? textColor;
  final Color backgroundColor;
  final Color progressColor;
  final String text;
  final double percent;
  final Function onTap;

  const ProgressiveCircle({
    super.key,
    this.textColor,
    required this.progressColor,
    required this.backgroundColor,
    required this.percent,
    required this.text,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: CircularPercentIndicator(
        animation: true,
        animationDuration: 1000,
        radius: 70,
        lineWidth: 5,
        progressColor: progressColor,
        backgroundColor: backgroundColor,
        circularStrokeCap: CircularStrokeCap.round,
        percent: percent,
        center: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
