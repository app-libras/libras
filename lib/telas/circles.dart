import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CirclesScreen extends StatefulWidget {
  const CirclesScreen({super.key});

  @override
  _CirclesScreenState createState() => _CirclesScreenState();
}

class _CirclesScreenState extends State<CirclesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(244, 4, 245, 149),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(children: [
                    CircularProgressIndicator(),
                    Icon(
                      Icons.person,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ]),
                ],
              )),
        ),
      ),
      body: const Center(
        child: CustomPaint(
          size: Size(300, 300),
          painter: null,
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Color.fromARGB(244, 4, 245, 149),
        height: 50,
      ),
    );
  }
}
