import 'package:flutter/material.dart';

class AulaScreen extends StatefulWidget {
  const AulaScreen({super.key});
  static const id = 'aula_screen';
  @override
  _AulaScreenState createState() => _AulaScreenState();
}

class _AulaScreenState extends State<AulaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alfabeto "),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).textTheme.titleMedium?.color,
                    fontSize: 20,
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'Esse sinal de alfabeto ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: 'A',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/aulas/abc_gif/A.gif'),
              ),
              Container(
                // padding: const EdgeInsets.all(20),
                child: const Center(
                  child: Text(
                    'A',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
