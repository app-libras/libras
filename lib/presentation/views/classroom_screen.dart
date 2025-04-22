import 'package:flutter/material.dart';

class ClassroomScreen extends StatelessWidget {
  static const id = 'classroom_screen';
  const ClassroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Aula', style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'assets/aulas/abc/A.gif',
                // height: 200,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                scale: 0.01,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
