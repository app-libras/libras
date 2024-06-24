// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class IndicatorScreen extends StatefulWidget {
  const IndicatorScreen({super.key});

  @override
  _IndicatorScreenState createState() => _IndicatorScreenState();
}

class _IndicatorScreenState extends State<IndicatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Olá usuario"),
      ),
      body: Center(
        child: Column(
          children: [
            CircularPercentIndicator(
              radius: 50,
              lineWidth: 10,
              progressColor: Colors.green,
              backgroundColor: Colors.greenAccent,
              circularStrokeCap: CircularStrokeCap.round,
              percent: 0.4,
              center: const Text("40%"),
            ),
            const SizedBox(
              height: 30,
            ),
            CircularPercentIndicator(
              radius: 50,
              lineWidth: 10,
              progressColor: Colors.green,
              backgroundColor: Colors.greenAccent,
              circularStrokeCap: CircularStrokeCap.round,
              percent: 0.0,
              center: const Text("0%"),
            ),
            const SizedBox(
              height: 30,
            ),
            CircularPercentIndicator(
              radius: 50,
              lineWidth: 10,
              progressColor: Colors.greenAccent,
              backgroundColor: Colors.greenAccent,
              circularStrokeCap: CircularStrokeCap.round,
              percent: 0.0,
              center: const Text("0%"),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
