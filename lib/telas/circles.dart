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
            ),
          ),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Hi ...',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(180),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const CircularProgressIndicator(),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    border: Border.all(color: Colors.yellowAccent),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const CircularProgressIndicator(),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const CircularProgressIndicator(),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ]),
      bottomNavigationBar: const BottomAppBar(
        color: Color.fromARGB(244, 4, 245, 149),
        height: 50,
      ),
    );
  }
}
