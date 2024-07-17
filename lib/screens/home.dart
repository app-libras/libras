// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Libras"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('Percentual de aprendizado:'),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircularPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      radius: 50,
                      lineWidth: 10,
                      progressColor: Colors.green,
                      backgroundColor: Colors.greenAccent,
                      circularStrokeCap: CircularStrokeCap.round,
                      percent: 0.4,
                      center: const Text(
                        "40%",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    CircularPercentIndicator(
                      radius: 50,
                      lineWidth: 10,
                      progressColor: Colors.green,
                      backgroundColor: Colors.greenAccent,
                      circularStrokeCap: CircularStrokeCap.round,
                      percent: 0.0,
                      center: const Text("0%"),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    CircularPercentIndicator(
                      radius: 50,
                      lineWidth: 10,
                      progressColor: Colors.greenAccent,
                      backgroundColor: Colors.greenAccent,
                      circularStrokeCap: CircularStrokeCap.round,
                      percent: 0.0,
                      center: const Text("0%"),
                    ),
                  ]),
            ),

            // const SizedBox(
            //   height: 10,
            // ),
          ],
        ),
      ),
      // ),
    );
  }
}
