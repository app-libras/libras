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
      backgroundColor: Colors.greenAccent,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: Padding(
            padding: EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 10,
                ),
              ],
            )),
      ),
    ));
  }
}
